onerror {resume}
virtual type { LDI0 LDI0 LDI0 LDI0 JMP JMP JMP JMP JMPIFN JMPIFN JMPIFN JMPIFN CALL CALL CALL CALL MOV AND OR ADD INP OUTP RET PUSH POP undef undef undef undef undef undef undef} opcode_t
quietly virtual function -install /top_tb/i_Top/i_Proc -env /top_tb/ { (opcode_t)/top_tb/i_Top/i_Proc/a_OpCode} OpCodeDecoded
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/Clk_k
add wave -noupdate /top_tb/Reset_r
add wave -noupdate /top_tb/i_Top/i_Proc/Port_ib
add wave -noupdate /top_tb/i_Top/i_Proc/Port_ob
add wave -noupdate -radix decimal -childformat {{/top_tb/i_Top/i_Proc/Memory_mb(0) -radix decimal -childformat {{/top_tb/i_Top/i_Proc/Memory_mb(0)(7) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(0)(6) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(0)(5) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(0)(4) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(0)(3) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(0)(2) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(0)(1) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(0)(0) -radix hexadecimal}}} {/top_tb/i_Top/i_Proc/Memory_mb(1) -radix decimal -childformat {{/top_tb/i_Top/i_Proc/Memory_mb(1)(7) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(1)(6) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(1)(5) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(1)(4) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(1)(3) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(1)(2) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(1)(1) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(1)(0) -radix hexadecimal}}} {/top_tb/i_Top/i_Proc/Memory_mb(2) -radix decimal} {/top_tb/i_Top/i_Proc/Memory_mb(3) -radix decimal} {/top_tb/i_Top/i_Proc/Memory_mb(4) -radix decimal} {/top_tb/i_Top/i_Proc/Memory_mb(5) -radix decimal -childformat {{/top_tb/i_Top/i_Proc/Memory_mb(5)(7) -radix decimal} {/top_tb/i_Top/i_Proc/Memory_mb(5)(6) -radix decimal} {/top_tb/i_Top/i_Proc/Memory_mb(5)(5) -radix decimal} {/top_tb/i_Top/i_Proc/Memory_mb(5)(4) -radix decimal} {/top_tb/i_Top/i_Proc/Memory_mb(5)(3) -radix decimal} {/top_tb/i_Top/i_Proc/Memory_mb(5)(2) -radix decimal} {/top_tb/i_Top/i_Proc/Memory_mb(5)(1) -radix decimal} {/top_tb/i_Top/i_Proc/Memory_mb(5)(0) -radix decimal}}} {/top_tb/i_Top/i_Proc/Memory_mb(6) -radix decimal} {/top_tb/i_Top/i_Proc/Memory_mb(7) -radix decimal}} -expand -subitemconfig {/top_tb/i_Top/i_Proc/Memory_mb(0) {-height 15 -radix decimal -childformat {{/top_tb/i_Top/i_Proc/Memory_mb(0)(7) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(0)(6) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(0)(5) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(0)(4) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(0)(3) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(0)(2) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(0)(1) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(0)(0) -radix hexadecimal}}} /top_tb/i_Top/i_Proc/Memory_mb(0)(7) {-height 15 -radix hexadecimal} /top_tb/i_Top/i_Proc/Memory_mb(0)(6) {-height 15 -radix hexadecimal} /top_tb/i_Top/i_Proc/Memory_mb(0)(5) {-height 15 -radix hexadecimal} /top_tb/i_Top/i_Proc/Memory_mb(0)(4) {-height 15 -radix hexadecimal} /top_tb/i_Top/i_Proc/Memory_mb(0)(3) {-height 15 -radix hexadecimal} /top_tb/i_Top/i_Proc/Memory_mb(0)(2) {-height 15 -radix hexadecimal} /top_tb/i_Top/i_Proc/Memory_mb(0)(1) {-height 15 -radix hexadecimal} /top_tb/i_Top/i_Proc/Memory_mb(0)(0) {-height 15 -radix hexadecimal} /top_tb/i_Top/i_Proc/Memory_mb(1) {-height 15 -radix decimal -childformat {{/top_tb/i_Top/i_Proc/Memory_mb(1)(7) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(1)(6) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(1)(5) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(1)(4) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(1)(3) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(1)(2) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(1)(1) -radix hexadecimal} {/top_tb/i_Top/i_Proc/Memory_mb(1)(0) -radix hexadecimal}}} /top_tb/i_Top/i_Proc/Memory_mb(1)(7) {-height 15 -radix hexadecimal} /top_tb/i_Top/i_Proc/Memory_mb(1)(6) {-height 15 -radix hexadecimal} /top_tb/i_Top/i_Proc/Memory_mb(1)(5) {-height 15 -radix hexadecimal} /top_tb/i_Top/i_Proc/Memory_mb(1)(4) {-height 15 -radix hexadecimal} /top_tb/i_Top/i_Proc/Memory_mb(1)(3) {-height 15 -radix hexadecimal} /top_tb/i_Top/i_Proc/Memory_mb(1)(2) {-height 15 -radix hexadecimal} /top_tb/i_Top/i_Proc/Memory_mb(1)(1) {-height 15 -radix hexadecimal} /top_tb/i_Top/i_Proc/Memory_mb(1)(0) {-height 15 -radix hexadecimal} /top_tb/i_Top/i_Proc/Memory_mb(2) {-height 15 -radix decimal} /top_tb/i_Top/i_Proc/Memory_mb(3) {-height 15 -radix decimal} /top_tb/i_Top/i_Proc/Memory_mb(4) {-height 15 -radix decimal} /top_tb/i_Top/i_Proc/Memory_mb(5) {-height 15 -radix decimal -childformat {{/top_tb/i_Top/i_Proc/Memory_mb(5)(7) -radix decimal} {/top_tb/i_Top/i_Proc/Memory_mb(5)(6) -radix decimal} {/top_tb/i_Top/i_Proc/Memory_mb(5)(5) -radix decimal} {/top_tb/i_Top/i_Proc/Memory_mb(5)(4) -radix decimal} {/top_tb/i_Top/i_Proc/Memory_mb(5)(3) -radix decimal} {/top_tb/i_Top/i_Proc/Memory_mb(5)(2) -radix decimal} {/top_tb/i_Top/i_Proc/Memory_mb(5)(1) -radix decimal} {/top_tb/i_Top/i_Proc/Memory_mb(5)(0) -radix decimal}}} /top_tb/i_Top/i_Proc/Memory_mb(5)(7) {-height 15 -radix decimal} /top_tb/i_Top/i_Proc/Memory_mb(5)(6) {-height 15 -radix decimal} /top_tb/i_Top/i_Proc/Memory_mb(5)(5) {-height 15 -radix decimal} /top_tb/i_Top/i_Proc/Memory_mb(5)(4) {-height 15 -radix decimal} /top_tb/i_Top/i_Proc/Memory_mb(5)(3) {-height 15 -radix decimal} /top_tb/i_Top/i_Proc/Memory_mb(5)(2) {-height 15 -radix decimal} /top_tb/i_Top/i_Proc/Memory_mb(5)(1) {-height 15 -radix decimal} /top_tb/i_Top/i_Proc/Memory_mb(5)(0) {-height 15 -radix decimal} /top_tb/i_Top/i_Proc/Memory_mb(6) {-height 15 -radix decimal} /top_tb/i_Top/i_Proc/Memory_mb(7) {-height 15 -radix decimal}} /top_tb/i_Top/i_Proc/Memory_mb
add wave -noupdate -label instructionMemory /top_tb/i_Top/i_InstructionMemory/Memory_mb
add wave -noupdate -label stack -expand /top_tb/i_Top/i_Proc/i_Stack/Memory_mb
add wave -noupdate -radix unsigned /top_tb/i_Top/i_Proc/RegIp
add wave -noupdate /top_tb/i_Top/i_Proc/RegIr
add wave -noupdate -expand -group IRDecoded /top_tb/i_Top/i_Proc/OpCodeDecoded
add wave -noupdate -expand -group IRDecoded -radix decimal /top_tb/i_Top/i_Proc/a_Value
add wave -noupdate -expand -group IRDecoded -radix unsigned /top_tb/i_Top/i_Proc/a_RamA
add wave -noupdate -expand -group IRDecoded -radix unsigned /top_tb/i_Top/i_Proc/a_RamB
add wave -noupdate /top_tb/i_Top/i_Proc/Controller_b
add wave -noupdate -expand -group controllerDecoded /top_tb/i_Top/i_Proc/a_InstructionFetch
add wave -noupdate -expand -group controllerDecoded /top_tb/i_Top/i_Proc/a_OperandFetch
add wave -noupdate -expand -group controllerDecoded /top_tb/i_Top/i_Proc/a_Execute
add wave -noupdate -expand -group controllerDecoded /top_tb/i_Top/i_Proc/a_MemoryWrite
add wave -noupdate -expand -group controllerDecoded /top_tb/i_Top/i_Proc/a_IpUpdate
add wave -noupdate /top_tb/i_Top/i_Proc/Operand_b
add wave -noupdate /top_tb/i_Top/i_Proc/ResultValue_b
add wave -noupdate /top_tb/i_Top/i_Proc/Flags_b
add wave -noupdate -expand -group flagsDecoded /top_tb/i_Top/i_Proc/a_FlagZero
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3380 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {4200 ns}
