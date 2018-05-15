library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory is
	port (
		clk: in std_logic;
		address: in unsigned(7 downto 0);
		data: out std_logic_vector(7 downto 0)
	);
end entity;

architecture base of memory is

	type MEMORY_T is array(0 to (2**address'length)-1) of std_logic_vector(data'range);
	
	-- IR:     76543210
	-- opCode: 76
	-- value:    543210
	-- RAMa:     543
	-- RAMb:        210
	
	--	opCodes:
	--   00 - LDI0 (r0 = value)
	--   01 - MOV (RAMa = RAMb)
	--   10 - ADD (RAMa = RAMa + RAMb)
	--   11 - JMPIFN (if (fZero) IP = IP + value)

	constant OP_LDI0: std_logic_vector(1 downto 0) := "00";
	constant OP_MOV: std_logic_vector(1 downto 0) := "01";
	constant OP_ADD: std_logic_vector(1 downto 0) := "10";
	constant OP_JMPIFN: std_logic_vector(1 downto 0) := "11";
	
	constant R0: integer := 0;
	constant R1: integer := 1;
	constant R2: integer := 2;
	constant R3: integer := 3;
	constant R4: integer := 4;
	constant R5: integer := 5;
	constant R6: integer := 6;
	constant R7: integer := 7;

	function LDI0(value: integer) return std_logic_vector is begin
		assert (value >= -32) and (value <= 31)
			report "We have only 6 bits for value! (from -32 to 31)"
			severity failure;
		return OP_LDI0 & std_logic_vector(to_signed(value, 6));
	end function;
	
	function MOV(a, b: integer) return std_logic_vector is begin
		assert (a >= 0) and (a < 8) and (b >= 0) and (b < 8)
			report "We have only 8 registers in scratch memory!"
			severity failure;
		return OP_MOV & std_logic_vector(to_unsigned(a, 3)) & std_logic_vector(to_unsigned(b, 3));
	end function;

	function ADD(a, b: integer) return std_logic_vector is begin
		assert (a >= 0) and (a < 8) and (b >= 0) and (b < 8)
			report "We have only 8 registers in scratch memory!"
			severity failure;
		return OP_ADD & std_logic_vector(to_unsigned(a, 3)) & std_logic_vector(to_unsigned(b, 3));
	end function;

	function JMPIFN(value: integer) return std_logic_vector is begin
		assert (value >= -32) and (value <= 31)
			report "We have only 6 bits for value! (from -32 to 31)"
			severity failure;
		return OP_JMPIFN & std_logic_vector(to_signed(value, 6));
	end function;
	
	function NOP return std_logic_vector is begin
		return MOV(R0, R0);
	end function;
	
	-- sum all numbers from 0 to 3
	-- input (3) in R0
	-- output (6) in R1
	signal memory: MEMORY_T := (
		LDI0(0),     --  0
		MOV(R1, R0), --  1
		LDI0(-1),    --  2
		MOV(R2, R0), --  3
		LDI0(3),     --  4
		ADD(R1, R0), --  5
		ADD(R0, R2), --  6
		JMPIFN(-2),  --  7
		LDI0(1),     --  8
		JMPIFN(0),   --  9
		others => NOP
	);

begin

	-- pMemory: process(clk) is begin
		-- if rising_edge(clk) then
			data <= memory(to_integer(address));
		-- end if;
	-- end process;

end architecture;