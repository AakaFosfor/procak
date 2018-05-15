onerror {resume}
virtual type { LDI0 LDI0 LDI0 LDI0 JMP JMP JMP JMP JMPIFN JMPIFN JMPIFN JMPIFN CALL CALL CALL CALL MOV AND OR ADD INP OUTP RET PUSH POP undef undef undef undef undef undef undef} opcode_t
quietly virtual function -install /top_tb/cTop/cProc -env /top_tb/pTimeOut { (opcode_t)/top_tb/cTop/cProc/opCode} opc_decoded
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/clk
add wave -noupdate /top_tb/reset
add wave -noupdate /top_tb/cTop/cProc/portIn
add wave -noupdate /top_tb/cTop/cProc/portOut
add wave -noupdate -radix decimal -childformat {{/top_tb/cTop/cProc/memory(0) -radix decimal -childformat {{/top_tb/cTop/cProc/memory(0)(7) -radix hexadecimal} {/top_tb/cTop/cProc/memory(0)(6) -radix hexadecimal} {/top_tb/cTop/cProc/memory(0)(5) -radix hexadecimal} {/top_tb/cTop/cProc/memory(0)(4) -radix hexadecimal} {/top_tb/cTop/cProc/memory(0)(3) -radix hexadecimal} {/top_tb/cTop/cProc/memory(0)(2) -radix hexadecimal} {/top_tb/cTop/cProc/memory(0)(1) -radix hexadecimal} {/top_tb/cTop/cProc/memory(0)(0) -radix hexadecimal}}} {/top_tb/cTop/cProc/memory(1) -radix decimal -childformat {{/top_tb/cTop/cProc/memory(1)(7) -radix hexadecimal} {/top_tb/cTop/cProc/memory(1)(6) -radix hexadecimal} {/top_tb/cTop/cProc/memory(1)(5) -radix hexadecimal} {/top_tb/cTop/cProc/memory(1)(4) -radix hexadecimal} {/top_tb/cTop/cProc/memory(1)(3) -radix hexadecimal} {/top_tb/cTop/cProc/memory(1)(2) -radix hexadecimal} {/top_tb/cTop/cProc/memory(1)(1) -radix hexadecimal} {/top_tb/cTop/cProc/memory(1)(0) -radix hexadecimal}}} {/top_tb/cTop/cProc/memory(2) -radix decimal} {/top_tb/cTop/cProc/memory(3) -radix decimal} {/top_tb/cTop/cProc/memory(4) -radix decimal} {/top_tb/cTop/cProc/memory(5) -radix decimal -childformat {{/top_tb/cTop/cProc/memory(5)(7) -radix decimal} {/top_tb/cTop/cProc/memory(5)(6) -radix decimal} {/top_tb/cTop/cProc/memory(5)(5) -radix decimal} {/top_tb/cTop/cProc/memory(5)(4) -radix decimal} {/top_tb/cTop/cProc/memory(5)(3) -radix decimal} {/top_tb/cTop/cProc/memory(5)(2) -radix decimal} {/top_tb/cTop/cProc/memory(5)(1) -radix decimal} {/top_tb/cTop/cProc/memory(5)(0) -radix decimal}}} {/top_tb/cTop/cProc/memory(6) -radix decimal} {/top_tb/cTop/cProc/memory(7) -radix decimal}} -expand -subitemconfig {/top_tb/cTop/cProc/memory(0) {-height 15 -radix decimal -childformat {{/top_tb/cTop/cProc/memory(0)(7) -radix hexadecimal} {/top_tb/cTop/cProc/memory(0)(6) -radix hexadecimal} {/top_tb/cTop/cProc/memory(0)(5) -radix hexadecimal} {/top_tb/cTop/cProc/memory(0)(4) -radix hexadecimal} {/top_tb/cTop/cProc/memory(0)(3) -radix hexadecimal} {/top_tb/cTop/cProc/memory(0)(2) -radix hexadecimal} {/top_tb/cTop/cProc/memory(0)(1) -radix hexadecimal} {/top_tb/cTop/cProc/memory(0)(0) -radix hexadecimal}}} /top_tb/cTop/cProc/memory(0)(7) {-height 15 -radix hexadecimal} /top_tb/cTop/cProc/memory(0)(6) {-height 15 -radix hexadecimal} /top_tb/cTop/cProc/memory(0)(5) {-height 15 -radix hexadecimal} /top_tb/cTop/cProc/memory(0)(4) {-height 15 -radix hexadecimal} /top_tb/cTop/cProc/memory(0)(3) {-height 15 -radix hexadecimal} /top_tb/cTop/cProc/memory(0)(2) {-height 15 -radix hexadecimal} /top_tb/cTop/cProc/memory(0)(1) {-height 15 -radix hexadecimal} /top_tb/cTop/cProc/memory(0)(0) {-height 15 -radix hexadecimal} /top_tb/cTop/cProc/memory(1) {-height 15 -radix decimal -childformat {{/top_tb/cTop/cProc/memory(1)(7) -radix hexadecimal} {/top_tb/cTop/cProc/memory(1)(6) -radix hexadecimal} {/top_tb/cTop/cProc/memory(1)(5) -radix hexadecimal} {/top_tb/cTop/cProc/memory(1)(4) -radix hexadecimal} {/top_tb/cTop/cProc/memory(1)(3) -radix hexadecimal} {/top_tb/cTop/cProc/memory(1)(2) -radix hexadecimal} {/top_tb/cTop/cProc/memory(1)(1) -radix hexadecimal} {/top_tb/cTop/cProc/memory(1)(0) -radix hexadecimal}}} /top_tb/cTop/cProc/memory(1)(7) {-height 15 -radix hexadecimal} /top_tb/cTop/cProc/memory(1)(6) {-height 15 -radix hexadecimal} /top_tb/cTop/cProc/memory(1)(5) {-height 15 -radix hexadecimal} /top_tb/cTop/cProc/memory(1)(4) {-height 15 -radix hexadecimal} /top_tb/cTop/cProc/memory(1)(3) {-height 15 -radix hexadecimal} /top_tb/cTop/cProc/memory(1)(2) {-height 15 -radix hexadecimal} /top_tb/cTop/cProc/memory(1)(1) {-height 15 -radix hexadecimal} /top_tb/cTop/cProc/memory(1)(0) {-height 15 -radix hexadecimal} /top_tb/cTop/cProc/memory(2) {-height 15 -radix decimal} /top_tb/cTop/cProc/memory(3) {-height 15 -radix decimal} /top_tb/cTop/cProc/memory(4) {-height 15 -radix decimal} /top_tb/cTop/cProc/memory(5) {-height 15 -radix decimal -childformat {{/top_tb/cTop/cProc/memory(5)(7) -radix decimal} {/top_tb/cTop/cProc/memory(5)(6) -radix decimal} {/top_tb/cTop/cProc/memory(5)(5) -radix decimal} {/top_tb/cTop/cProc/memory(5)(4) -radix decimal} {/top_tb/cTop/cProc/memory(5)(3) -radix decimal} {/top_tb/cTop/cProc/memory(5)(2) -radix decimal} {/top_tb/cTop/cProc/memory(5)(1) -radix decimal} {/top_tb/cTop/cProc/memory(5)(0) -radix decimal}}} /top_tb/cTop/cProc/memory(5)(7) {-height 15 -radix decimal} /top_tb/cTop/cProc/memory(5)(6) {-height 15 -radix decimal} /top_tb/cTop/cProc/memory(5)(5) {-height 15 -radix decimal} /top_tb/cTop/cProc/memory(5)(4) {-height 15 -radix decimal} /top_tb/cTop/cProc/memory(5)(3) {-height 15 -radix decimal} /top_tb/cTop/cProc/memory(5)(2) {-height 15 -radix decimal} /top_tb/cTop/cProc/memory(5)(1) {-height 15 -radix decimal} /top_tb/cTop/cProc/memory(5)(0) {-height 15 -radix decimal} /top_tb/cTop/cProc/memory(6) {-height 15 -radix decimal} /top_tb/cTop/cProc/memory(7) {-height 15 -radix decimal}} /top_tb/cTop/cProc/memory
add wave -noupdate -label instructionMemory /top_tb/cTop/cInstructionMemory/memory
add wave -noupdate -label stack -expand /top_tb/cTop/cProc/cStack/memory
add wave -noupdate -radix unsigned /top_tb/cTop/cProc/IP
add wave -noupdate /top_tb/cTop/cProc/IR
add wave -noupdate -expand -group IRDecoded /top_tb/cTop/cProc/opc_decoded
add wave -noupdate -expand -group IRDecoded -radix decimal /top_tb/cTop/cProc/value
add wave -noupdate -expand -group IRDecoded -radix unsigned /top_tb/cTop/cProc/RAMa
add wave -noupdate -expand -group IRDecoded -radix unsigned /top_tb/cTop/cProc/RAMb
add wave -noupdate /top_tb/cTop/cProc/controller
add wave -noupdate -expand -group controllerDecoded /top_tb/cTop/cProc/IREnable
add wave -noupdate -expand -group controllerDecoded /top_tb/cTop/cProc/operandSave
add wave -noupdate -expand -group controllerDecoded /top_tb/cTop/cProc/execute
add wave -noupdate -expand -group controllerDecoded /top_tb/cTop/cProc/memoryWrite
add wave -noupdate -expand -group controllerDecoded /top_tb/cTop/cProc/IPEnable
add wave -noupdate /top_tb/cTop/cProc/operand
add wave -noupdate /top_tb/cTop/cProc/resultValue
add wave -noupdate /top_tb/cTop/cProc/flags
add wave -noupdate -expand -group flagsDecoded /top_tb/cTop/cProc/fZero
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
