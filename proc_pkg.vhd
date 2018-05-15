library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package proc_pkg is

	-- TODO instructions:
	--  CALL
	--  RET
	--  POP

	subtype INSTRUCTION_T is std_logic_vector(10 downto 0);

	-- IR:     A9876543210
	-- opCode: A9876
	-- value:     76543210
	-- RAMa:        543
	-- RAMb:           210
	
	--	opCodes:
	--   0 00   - LDI0 (r0 = value)
	--   0 01   - JMPIFN (if (!fZero) IP = IP + value)
	--   0 10   - CALL (push(IP), IP = value)
	--   0 11   -
	--   1 0000 - MOV (RAMa = RAMb)
	--   1 0001 - AND (RAMa = RAMa and RAMb)
	--   1 0010 - OR (RAMa = RAMa or RAMb)
	--   1 0011 - ADD (RAMa = RAMa + RAMb)
	--   1 0100 - INP (RAMa = portIn)
	--   1 0101 - OUTP (portOut = RAMa)
	--   1 0110 - RET (pop(IP))
	--   1 0111 - PUSH (push(RAMa))
	--   1 1000 - POP (pop(RAMa))
	--   1 1001 -
	--   1 1010 -
	--   1 1011 -
	--   1 1100 -
	--   1 1101 -
	--   1 1110 -
	--   1 1111 - 
	constant OP_LDI0:   std_logic_vector(4 downto 0) := "000--";
	constant OP_JMPIFN: std_logic_vector(4 downto 0) := "001--";
	constant OP_CALL:   std_logic_vector(4 downto 0) := "010--";
	--nstant XXXXXXX:   std_logic_vector(4 downto 0) := "011--";
	constant OP_MOV:    std_logic_vector(4 downto 0) := "10000";
	constant OP_AND:    std_logic_vector(4 downto 0) := "10001";
	constant OP_OR:     std_logic_vector(4 downto 0) := "10010";
	constant OP_ADD:    std_logic_vector(4 downto 0) := "10011";
	constant OP_INP:    std_logic_vector(4 downto 0) := "10100";
	constant OP_OUTP:   std_logic_vector(4 downto 0) := "10101";
	constant OP_RET:    std_logic_vector(4 downto 0) := "10110";
	constant OP_PUSH:   std_logic_vector(4 downto 0) := "10111";
	constant OP_POP:    std_logic_vector(4 downto 0) := "11000";
	
	-- registers names
	constant R0: integer := 0;
	constant R1: integer := 1;
	constant R2: integer := 2;
	constant R3: integer := 3;
	constant R4: integer := 4;
	constant R5: integer := 5;
	constant R6: integer := 6;
	constant R7: integer := 7;

	function LDI0(value: integer) return std_logic_vector;
	function JMPIFN(value: integer) return std_logic_vector;
	function CALL(value: integer) return std_logic_vector;
	
	function MOV(a, b: integer) return std_logic_vector;
	function iAND(a, b: integer) return std_logic_vector;
	function iOR(a, b: integer) return std_logic_vector;
	function ADD(a, b: integer) return std_logic_vector;
	function INP(a: integer) return std_logic_vector;
	function OUTP(a: integer) return std_logic_vector;
	function RET return std_logic_vector;
	function PUSH (a: integer) return std_logic_vector;
	function POP (a: integer) return std_logic_vector;

	function NOP return std_logic_vector;
	
end package;

package body proc_pkg is

	function LDI0(value: integer) return std_logic_vector is begin
		assert (value >= -128) and (value <= 127)
			report "We have only 8 bits for value! (from -128 to 127)"
			severity failure;
		return OP_LDI0(4 downto 2) & std_logic_vector(to_signed(value, 8));
	end function;
	
	function JMPIFN(value: integer) return std_logic_vector is begin
		assert (value >= -128) and (value <= 127)
			report "We have only 8 bits for value! (from -128 to 127)"
			severity failure;
		return OP_JMPIFN(4 downto 2) & std_logic_vector(to_signed(value, 8));
	end function;
	
	function CALL(value: integer) return std_logic_vector is begin
		assert (value >= -128) and (value <= 127)
			report "We have only 8 bits for value! (from -128 to 127)"
			severity failure;
		return OP_CALL(4 downto 2) & std_logic_vector(to_signed(value, 8));
	end function;

	
	function MOV(a, b: integer) return std_logic_vector is begin
		assert (a >= 0) and (a < 8) and (b >= 0) and (b < 8)
			report "We have only 8 registers in scratch memory!"
			severity failure;
		return OP_MOV & std_logic_vector(to_unsigned(a, 3)) & std_logic_vector(to_unsigned(b, 3));
	end function;

	function iAND(a, b: integer) return std_logic_vector is begin
		assert (a >= 0) and (a < 8) and (b >= 0) and (b < 8)
			report "We have only 8 registers in scratch memory!"
			severity failure;
		return OP_AND & std_logic_vector(to_unsigned(a, 3)) & std_logic_vector(to_unsigned(b, 3));
	end function;

	function iOR(a, b: integer) return std_logic_vector is begin
		assert (a >= 0) and (a < 8) and (b >= 0) and (b < 8)
			report "We have only 8 registers in scratch memory!"
			severity failure;
		return OP_OR & std_logic_vector(to_unsigned(a, 3)) & std_logic_vector(to_unsigned(b, 3));
	end function;

	function ADD(a, b: integer) return std_logic_vector is begin
		assert (a >= 0) and (a < 8) and (b >= 0) and (b < 8)
			report "We have only 8 registers in scratch memory!"
			severity failure;
		return OP_ADD & std_logic_vector(to_unsigned(a, 3)) & std_logic_vector(to_unsigned(b, 3));
	end function;

	function INP(a: integer) return std_logic_vector is begin
		assert (a >= 0) and (a < 8)
			report "We have only 8 registers in scratch memory!"
			severity failure;
		return OP_INP & std_logic_vector(to_unsigned(a, 3)) & "000";
	end function;

	function OUTP(a: integer) return std_logic_vector is begin
		assert (a >= 0) and (a < 8)
			report "We have only 8 registers in scratch memory!"
			severity failure;
		return OP_OUTP & std_logic_vector(to_unsigned(a, 3)) & "000";
	end function;

	function RET return std_logic_vector is begin
		return OP_RET & "000000";
	end function;

	function PUSH(a: integer) return std_logic_vector is begin
		assert (a >= 0) and (a < 8)
			report "We have only 8 registers in scratch memory!"
			severity failure;
		return OP_PUSH & std_logic_vector(to_unsigned(a, 3)) & "000";
	end function;

	function POP(a: integer) return std_logic_vector is begin
		assert (a >= 0) and (a < 8)
			report "We have only 8 registers in scratch memory!"
			severity failure;
		return OP_POP & std_logic_vector(to_unsigned(a, 3)) & "000";
	end function;

	
	function NOP return std_logic_vector is begin
		return MOV(R0, R0);
	end function;
	
end package body;
