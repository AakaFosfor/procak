library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.proc_pkg.all;

entity top is
    port (
        Clk_ik: in std_logic;
        Reset_ir: in std_logic;
        Port_ib: in std_logic_vector(7 downto 0);
        Port_ob: out std_logic_vector(7 downto 0)
    );
end entity;

architecture base of top is

    signal Address_b: unsigned(7 downto 0);
    signal Instruction_b: t_Instruction;

begin

    i_InstructionMemory: entity work.memory(base)
        port map (
            Clk_ik => Clk_ik,
            Address_ib => Address_b,
            Data_ob => Instruction_b
        );

    i_Proc: entity work.proc(base)
        port map (
            Clk_ik => Clk_ik,
            Reset_ir => Reset_ir,
            Address_ob => Address_b,
            Instruction_ib => Instruction_b,
            Port_ib => Port_ib,
            Port_ob => Port_ob
        );

end architecture;