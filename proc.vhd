library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity proc is
	port (
		clk: in std_logic;
		reset: in std_logic;
		address: out unsigned(7 downto 0);
		instruction: in std_logic_vector(7 downto 0)
	);
end entity;

architecture base of proc is

	type MEMORY_T is array(0 to 7) of signed(7 downto 0);
	
	constant OP_LDI0: std_logic_vector(1 downto 0) := "00";
	constant OP_MOV: std_logic_vector(1 downto 0) := "01";
	constant OP_ADD: std_logic_vector(1 downto 0) := "10";
	constant OP_JMPIFN: std_logic_vector(1 downto 0) := "11";

	-- instruction pointer
	signal IP: unsigned(7 downto 0) := (others => '0');
	-- instruction register
	signal IR: std_logic_vector(7 downto 0);
		alias opCode is IR(7 downto 6);
		alias value is IR(5 downto 0);
		alias RAMa is IR(5 downto 3);
		alias RAMb is IR(2 downto 0);
	-- scratch memory
	signal memory: MEMORY_T;
	signal operand: signed(7 downto 0);
	signal resultValue: signed(7 downto 0);
	-- ALU
	signal flags: std_logic_vector(0 downto 0);
		alias fZero is flags(0);
	
	-- IR:     76543210
	-- opCode: 76
	-- value:    543210
	-- RAMa:     543
	-- RAMb:        210
	
	--	opCodes:
	--   00 - LDI0 (r0 = value)
	--   01 - MOV (RAMa = RAMb)
	--   10 - ADD (RAMa = RAMa + RAMb)
	--   11 - JMPIFN (if (!fZero) IP = IP + value)
	
	-- controller
	constant CONTROLLER_DEFAULT: std_logic_vector(0 to 4) := (others => '0');
	
	signal controller: std_logic_vector(0 to 4) := CONTROLLER_DEFAULT;
		alias IREnable is controller(0);
		alias operandSave is controller(1);
		alias execute is controller(2);
		alias memoryWrite is controller(3);
		alias IPEnable is controller(4);

begin

	-- instruction pointer
	pIP: process(clk) is begin
		if rising_edge(clk) then
			if reset = '1' then
				IP <= (others => '0');
			else
				if IPEnable = '1' then
					if (opCode = OP_JMPIFN) and (fZero = '0') then
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
				operand <= memory(to_integer(unsigned(RAMa)));
			end if;
		end if;
	end process;
	
	-- ALU and friends
	pSaveValue: process(clk) is
		variable newValue: signed(7 downto 0);
	begin
		if rising_edge(clk) then
			if (execute = '1') and opCode /= OP_JMPIFN then
				fZero <= '0';
				case opCode is
					when OP_LDI0 =>
						newValue := signed(value(5)&value(5)&value);
					when OP_MOV =>
						newValue := memory(to_integer(unsigned(RAMb)));
					when OP_ADD =>
						newValue := operand + memory(to_integer(unsigned(RAMb)));
					when others =>
						newValue := (others => '0');
				end case;
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
			if (memoryWrite = '1') and opCode /= OP_JMPIFN then
				if opCode = OP_LDI0 then
					memoryAddress := 0;
				else
					memoryAddress := to_integer(unsigned(RAMa));
				end if;
				memory(memoryAddress) <= resultValue;
			end if;
		end if;
	end process;
	
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