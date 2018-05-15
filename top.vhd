library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
	port (
		clk: in std_logic;
		reset: in std_logic
	);
end entity;

architecture base of top is

	signal address: unsigned(7 downto 0);
	signal instruction: std_logic_vector(7 downto 0);

begin

	cInstructionMemory: entity work.memory(base)
		port map (
			clk => clk,
			address => address,
			data => instruction
		);

	cProc: entity work.proc(base)
		port map (
			clk => clk,
			reset => reset,
			address => address,
			instruction => instruction
		);

end architecture;