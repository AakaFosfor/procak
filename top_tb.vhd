library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_tb is
end entity;

architecture testbench of top_tb is

	signal clk: std_logic := '0';
	signal reset: std_logic := '1';

begin

	cTop: entity work.top(base)
		port map (
			clk => clk,
			reset => reset
		);
	
	clk <= not clk after 5 ns;
	reset <= '0' after 20 ns;
	
	pTimeOut: process is begin
		wait for 1 us;
		assert false report "Timeout!" severity failure;
	end process; 

end architecture;