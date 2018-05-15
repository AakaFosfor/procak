library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.proc_pkg.all;

entity proc is
    port (
        Clk_ik: in std_logic;
        Reset_ir: in std_logic;
        Address_ob: out unsigned(7 downto 0);
        Instruction_ib: in t_Instruction;
        Port_ib: in std_logic_vector(7 downto 0);
        Port_ob: out std_logic_vector(7 downto 0) := (others => '0')
    );
end entity;

architecture base of proc is

    type t_Memory is array(0 to 7) of signed(7 downto 0);
    
    signal StackPush, StackPop: std_logic;
    signal StackDataIn_b, StackDataOut_b: std_logic_vector(7 downto 0);
    
    -- instruction pointer
    signal RegIp: unsigned(7 downto 0) := (others => '0');
    -- instruction register
    signal RegIr: t_Instruction;
        alias a_OpCode is RegIr(t_Instruction'high downto 6);
        alias a_Value is RegIr(7 downto 0);
        alias a_RamA is RegIr(5 downto 3);
        alias a_RamB is RegIr(2 downto 0);
    -- scratch memory
    signal Memory_mb: t_Memory;
    signal Operand_b: signed(7 downto 0);
    signal ResultValue_b: signed(7 downto 0);
    -- ALU
    signal Flags_b: std_logic_vector(0 downto 0);
        alias a_FlagZero is Flags_b(0);
    
    -- controller
    constant c_ControllerDefault: std_logic_vector(0 to 4) := (others => '0');
    
    signal Controller_b: std_logic_vector(0 to 4) := c_ControllerDefault;
        alias a_InstructionFetch is Controller_b(0);
        alias a_OperandFetch is Controller_b(1);
        alias a_Execute is Controller_b(2);
        alias a_MemoryWrite is Controller_b(3);
        alias a_IpUpdate is Controller_b(4);

begin

    StackDataIn_b <= std_logic_vector(ResultValue_b);
    i_Stack: entity work.stack(base)
        generic map (
            g_Depth => 16
        )
        port map (
            Clk_ik => Clk_ik,
            Push_i => StackPush,
            Pop_i => StackPop,
            Data_ib => StackDataIn_b,
            Data_ob => StackDataOut_b
        );

    -- instruction register
    pIR: process(Clk_ik) is begin
        if rising_edge(Clk_ik) then
            if a_InstructionFetch = '1' then
                RegIr <= Instruction_ib;
            end if;
        end if;
    end process;
    
    -- operand
    pOperand: process(Clk_ik) is begin
        if rising_edge(Clk_ik) then
            if a_OperandFetch = '1' then
                if std_match(a_OpCode, OP_INP) then
                    Operand_b <= signed(Port_ib);
                elsif std_match(a_OpCode, OP_LDI0) or std_match(a_OpCode, OP_JMP) then
                    Operand_b <= signed(a_Value);
                elsif std_match(a_OpCode, OP_POP) or std_match(a_OpCode, OP_RET) then
                    Operand_b <= signed(StackDataOut_b);
                elsif std_match(a_OpCode, OP_CALL) then
                    Operand_b <= signed(RegIp);
                else
                    Operand_b <= Memory_mb(to_integer(unsigned(a_RamA)));
                end if;
            end if;
        end if;
    end process;
    StackPop <=
        a_OperandFetch when std_match(a_OpCode, OP_POP) or std_match(a_OpCode, OP_RET) else
        '0';
    
    -- ALU and friends
    pSaveValue: process(Clk_ik) is
        variable NewValue_b: signed(7 downto 0);
    begin
        if rising_edge(Clk_ik) then
            if (a_Execute = '1') and not std_match(a_OpCode, OP_RJMPIFN) then
                a_FlagZero <= '0';
                if std_match(a_OpCode, OP_MOV) then
                    NewValue_b := Memory_mb(to_integer(unsigned(a_RamB)));
                elsif std_match(a_OpCode, OP_ADD) then
                    NewValue_b := Operand_b + Memory_mb(to_integer(unsigned(a_RamB)));
                elsif std_match(a_OpCode, OP_AND) then
                    NewValue_b := Operand_b and Memory_mb(to_integer(unsigned(a_RamB)));
                elsif std_match(a_OpCode, OP_XOR) then
                    NewValue_b := Operand_b xor Memory_mb(to_integer(unsigned(a_RamB)));
                elsif std_match(a_OpCode, OP_OR) then
                    NewValue_b := Operand_b or Memory_mb(to_integer(unsigned(a_RamB)));
                elsif std_match(a_OpCode, OP_ROR) then
                    NewValue_b := Operand_b(0) & Operand_b(7 downto 1);
                elsif std_match(a_OpCode, OP_LDI0)
                    or std_match(a_OpCode, OP_INP)
                    or std_match(a_OpCode, OP_PUSH)
                    or std_match(a_OpCode, OP_POP)
                    or std_match(a_OpCode, OP_JMP)
                    or std_match(a_OpCode, OP_CALL)
                    or std_match(a_OpCode, OP_RET)
                    or std_match(a_OpCode, OP_OUTP) then
                    NewValue_b := Operand_b;
                else
                    NewValue_b := (others => '0');
                end if;
                if NewValue_b = "00000000" then
                    a_FlagZero <= '1';
                end if;
                ResultValue_b <= NewValue_b;
            end if;
        end if;
    end process;
    
    -- scratch memory
    pScratchMemory: process(Clk_ik) is
        variable MemoryAddress_b: integer;
    begin
        if rising_edge(Clk_ik) then
            if a_MemoryWrite = '1' then
                if not std_match(a_OpCode, OP_RJMPIFN)
                    and not std_match(a_OpCode, OP_OUTP)
                    and not std_match(a_OpCode, OP_JMP)
                    and not std_match(a_OpCode, OP_CALL)
                    and not std_match(a_OpCode, OP_RET)
                    and not std_match(a_OpCode, OP_OUTP) then
                    if std_match(a_OpCode, OP_LDI0) then
                        MemoryAddress_b := 0;
                    else
                        MemoryAddress_b := to_integer(unsigned(a_RamA));
                    end if;
                    Memory_mb(MemoryAddress_b) <= ResultValue_b;
                elsif std_match(a_OpCode, OP_OUTP) then
                    Port_ob <= std_logic_vector(ResultValue_b);
                end if;
            end if;
        end if;
    end process;
    StackPush <=
        a_MemoryWrite when std_match(a_OpCode, OP_PUSH) or std_match(a_OpCode, OP_CALL) else
        '0';
    
    -- instruction pointer
    pIP: process(Clk_ik) is begin
        if rising_edge(Clk_ik) then
            if Reset_ir = '1' then
                RegIp <= (others => '0');
            else
                if a_IpUpdate = '1' then
                    if std_match(a_OpCode, OP_JMP) or std_match(a_OpCode, OP_CALL) then
                        RegIp <= unsigned(a_Value);
                    elsif std_match(a_OpCode, OP_RET) then
                        RegIp <= unsigned(ResultValue_b + 1);
                    elsif std_match(a_OpCode, OP_RJMPIFN) and (a_FlagZero = '0') then
                        RegIp <= unsigned(signed(RegIp) + signed(a_Value));
                    else
                        RegIp <= RegIp + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;
    
    -- controller
    pController: process (Clk_ik) is begin
        if rising_edge(Clk_ik) then
            if Reset_ir = '1' then
                Controller_b <= c_ControllerDefault;
            else
                if Controller_b = c_ControllerDefault then
                    Controller_b <= "10000";
                else
                    Controller_b <= Controller_b(4)&Controller_b(0 to 3);
                end if;
            end if;
        end if;
    end process;

    Address_ob <= RegIp;

end architecture;