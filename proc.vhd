library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.proc_pkg.all;

entity proc is
	port (
		clk: in std_logic;
		reset: in std_logic;
		address: out unsigned(7 downto 0);
		instruction: in INSTRUCTION_T;
		portIn: in std_logic_vector(7 downto 0);
		portOut: out std_logic_vector(7 downto 0) := (others => '0')
	);
end entity;

architecture base of proc is

	type MEMORY_T is array(0 to 7) of signed(7 downto 0);
	
	signal stackPush, stackPop: std_logic;
	signal stackDataIn, stackDataOut: std_logic_vector(7 downto 0);
	
	-- instruction pointer
	signal IP: unsigned(7 downto 0) := (others => '0');
	-- instruction register
	signal IR: INSTRUCTION_T;
		alias opCode is IR(INSTRUCTION_T'high downto 6);
		alias value is IR(7 downto 0);
		alias RAMa is IR(5 downto 3);
		alias RAMb is IR(2 downto 0);
	-- scratch memory
	signal memory: MEMORY_T;
	signal operand: signed(7 downto 0);
	signal resultValue: signed(7 downto 0);
	-- ALU
	signal flags: std_logic_vector(0 downto 0);
		alias fZero is flags(0);
	
	-- controller
	constant CONTROLLER_DEFAULT: std_logic_vector(0 to 4) := (others => '0');
	
	signal controller: std_logic_vector(0 to 4) := CONTROLLER_DEFAULT;
		alias IREnable is controller(0);
		alias operandSave is controller(1);
		alias execute is controller(2);
		alias memoryWrite is controller(3);
		alias IPEnable is controller(4);

begin

	stackDataIn <= std_logic_vector(resultValue);
	cStack: entity work.stack(base)
		generic map (
			DEPTH => 16
		)
		port map (
			clk => clk,
			push => stackPush,
			pop => stackPop,
			dataIn => stackDataIn,
			dataOut => stackDataOut
		);

	-- instruction pointer
	pIP: process(clk) is begin
		if rising_edge(clk) then
			if reset = '1' then
				IP <= (others => '0');
			else
				if IPEnable = '1' then
					if std_match(opCode, OP_JMPIFN) and (fZero = '0') then
						IP <= unsigned(signed(IP) + signed(value));
					else
						IP <= IP + 1;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	-- instruction register
	pIR: process(clk) is begin
		if rising_edge(clk) then
			if IREnable = '1' then
				IR <= instruction;
			end if;
		end if;
	end process;
	
	-- operand
	pOperand: process(clk) is begin
		if rising_edge(clk) then
			if operandSave = '1' then
				if std_match(opCode, OP_INP) then
					operand <= signed(portIn);
				elsif std_match(opCode, OP_LDI0) then
					operand <= signed(value);
				elsif std_match(opCode, OP_POP) then
					operand <= signed(stackDataOut);
				else
					operand <= memory(to_integer(unsigned(RAMa)));
				end if;
			end if;
		end if;
	end process;
	stackPop <=
		operandSave when std_match(opCode, OP_POP) else
		'0';
	
	-- ALU and friends
	pSaveValue: process(clk) is
		variable newValue: signed(7 downto 0);
	begin
		if rising_edge(clk) then
			if (execute = '1') and not std_match(opCode, OP_JMPIFN) then
				fZero <= '0';
				if std_match(opCode, OP_MOV) then
					newValue := memory(to_integer(unsigned(RAMb)));
				elsif std_match(opCode, OP_ADD) then
					newValue := operand + memory(to_integer(unsigned(RAMb)));
				elsif std_match(opCode, OP_AND) then
					newValue := operand and memory(to_integer(unsigned(RAMb)));
				elsif std_match(opCode, OP_OR) then
					newValue := operand or memory(to_integer(unsigned(RAMb)));
				elsif std_match(opCode, OP_LDI0)
					or std_match(opCode, OP_INP)
					or std_match(opCode, OP_PUSH)
					or std_match(opCode, OP_POP) then
					newValue := operand;
				else
					newValue := (others => '0');
				end if;
				if newValue = "00000000" then
					fZero <= '1';
				end if;
				resultValue <= newValue;
			end if;
		end if;
	end process;
	
	-- scratch memory
	pScratchMemory: process(clk) is
		variable memoryAddress: integer;
	begin
		if rising_edge(clk) then
			if memoryWrite = '1' then
				if not std_match(opCode, OP_JMPIFN) and not std_match(opCode, OP_OUTP) then
					if std_match(opCode, OP_LDI0) then
						memoryAddress := 0;
					else
						memoryAddress := to_integer(unsigned(RAMa));
					end if;
					memory(memoryAddress) <= resultValue;
				elsif std_match(opCode, OP_OUTP) then
					portOut <= std_logic_vector(resultValue);
				end if;
			end if;
		end if;
	end process;
	stackPush <=
		memoryWrite when std_match(opCode, OP_PUSH) else
		'0';
	
	-- controller
	pController: process (clk) is begin
		if rising_edge(clk) then
			if reset = '1' then
				controller <= CONTROLLER_DEFAULT;
			else
				if controller = CONTROLLER_DEFAULT then
					controller <= "10000";
				else
					controller <= controller(4)&controller(0 to 3);
				end if;
			end if;
		end if;
	end process;

	address <= IP;

end architecture;