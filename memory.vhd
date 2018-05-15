library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.proc_pkg.all;

entity memory is
	port (
		clk: in std_logic;
		address: in unsigned(7 downto 0);
		data: out INSTRUCTION_T
	);
end entity;

architecture base of memory is

	type MEMORY_T is array(0 to (2**address'length)-1) of std_logic_vector(data'range);
	
	-- sum all numbers from 0 to 3
	-- input (3) in R0
	-- output (6) in R1
	signal memory: MEMORY_T := (
		--- port test
		INP(R5),
		OUTP(R5),
		--- AND/OR test
		LDI0(5),
		MOV(R1, R0),
		LDI0(3),
		iAND(R0, R1),
		LDI0(3),
		iOR(R0, R1),
		--- stack test
		LDI0(120),
		PUSH(R0),
		LDI0(55),
		MOV(R2, R0),
		PUSH(R2),
		PUSH(R0),
		PUSH(R2),
		POP(R5),
		POP(R4),
		LDI0(120),
		PUSH(R0),
		POP(R5),
		--- test program 
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

	data <= memory(to_integer(address));

end architecture;