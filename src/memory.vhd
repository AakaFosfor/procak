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
	-- input (10) in R0
	-- output (55) in R1
	signal memory: MEMORY_T := (
		--- test program
		LDI0(0),
		MOV(R1, R0),
		LDI0(-1),
		MOV(R2, R0),
		LDI0(10), -- input
		CALL(30),
		ADD(R0, R2),
		RJMPIFN(-2),
		OUTP(R1),
		LDI0(1),
		RJMPIFN(0),
		NOP,
		NOP,
		NOP,
		NOP,
		NOP,
		NOP,
		NOP,
		NOP,
		NOP,
		NOP,
		NOP,
		NOP,
		NOP,
		NOP,
		NOP,
		NOP,
		NOP,
		NOP,
		NOP,
		NOP,

		-- [30] adder
		-- input: R1, R0
		-- output: R1 = R1 + R0
		ADD(R1, R0),
		RET,

		others => NOP
	);

begin

	data <= memory(to_integer(address));

end architecture;