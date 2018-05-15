library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_tb is
end entity;

architecture testbench of top_tb is

	signal Clk_k: std_logic := '0';
	signal Reset_r: std_logic := '1';
	signal PortIn_b: std_logic_vector(7 downto 0) := (others => '0');
	signal PortOut_b: std_logic_vector(7 downto 0);

begin

	i_Top: entity work.top(base)
		port map (
			Clk_ik => Clk_k,
			Reset_ir => Reset_r,
			Port_ib => PortIn_b,
			Port_ob => PortOut_b
		);
	
	Clk_k <= not Clk_k after 5 ns;
	Reset_r <= '0' after 20 ns;
	
	pTimeOut: process is begin
		PortIn_b <= "01010101";
		wait for 4 us;
		assert false report "Timeout!" severity failure;
	end process; 

end architecture;