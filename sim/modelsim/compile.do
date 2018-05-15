# compile DUT
vcom -2008 -work work ../../src/proc_pkg.vhd
vcom -2008 -work work ../../src/stack.vhd
vcom -2008 -work work ../../src/proc.vhd
vcom -2008 -work work ../../src/memory.vhd
vcom -2008 -work work ../../src/top.vhd

# compile testbench
vcom -2008 -work work ../top_tb.vhd
