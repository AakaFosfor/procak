library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.proc_pkg.all;

entity stack is
    generic (
        g_Depth: integer := 16
    );
    port (
        Clk_ik: in std_logic;
        Push_i: in std_logic;
        Pop_i: in std_logic;
        Data_ib: in std_logic_vector(7 downto 0);
        Data_ob: out std_logic_vector(7 downto 0)
    );
end entity;

architecture base of stack is

    type t_Memory is array(0 to g_Depth-1) of std_logic_vector(Data_ib'range);
    subtype t_Address is integer range 0 to g_Depth-1;
    
    signal Memory_mb: t_Memory;
    signal Address_b: t_Address := 0;

begin

    pPushData: process (Clk_ik) is begin
        if rising_edge(Clk_ik) then
            if Push_i = '1' and Pop_i = '0' then
                Memory_mb(Address_b) <= Data_ib;
            end if;
        end if;
    end process;

    pAddress: process (Clk_ik) is begin
        if rising_edge(Clk_ik) then
            if Push_i = '1' and Pop_i = '0' then
                Address_b <= (Address_b + 1) mod g_Depth;
            elsif Pop_i = '1' and Push_i = '0' then
                Address_b <= (Address_b - 1) mod g_Depth;
            end if;
        end if;
    end process;

    Data_ob <= Memory_mb((Address_b-1) mod g_Depth);

end architecture;