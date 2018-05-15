library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.proc_pkg.all;

entity top is
	port (
		clk: in std_logic;
		reset: in std_logic;
		portIn: in std_logic_vector(7 downto 0);
		portOut: out std_logic_vector(7 downto 0)
	);
end entity;

architecture base of top is

	signal address: unsigned(7 downto 0);
	signal instruction: INSTRUCTION_T;

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
			instruction => instruction,
			portIn => portIn,
			portOut => portOut
		);

end architecture;