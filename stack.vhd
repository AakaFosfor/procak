library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.proc_pkg.all;

entity stack is
	generic (
		DEPTH: integer := 16
	);
	port (
		clk: in std_logic;
		push: in std_logic;
		pop: in std_logic;
		dataIn: out std_logic_vector(7 downto 0);
		dataOut: out std_logic_vector(7 downto 0);
		overFlow: out std_logic
	);
end entity;

architecture base of stack is

	type MEMORY_T is array(0 to DEPTH-1) of std_logic_vector(dataIn'range);
	subtype ADDRESS_T is integer range 0 to DEPTH-1;
	
	signal memory: MEMORY_T;
	signal address: ADDRESS_T := 0;

begin

	pPushData: process (clk) is begin
		if rising_edge(clk) then
			if push = '1' and pop = '0' then
				memory(address) <= dataIn;
			end if;
		end if;
	end process;

	pAddress: process (clk) is begin
		if rising_edge(clk) then
			if push = '1' and pop = '0' then
				address <= address + 1;
			elsif pop = '1' and push = '0' then
				address <= address - 1;
			end if;
		end if;
	end process;

	dataOut <= memory((address-1) mod DEPTH);

end architecture;