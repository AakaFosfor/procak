`timescale 1ns/1ps

module top_tb;

    localparam c_Frequency = 100e6; // Hz
    
    localparam time c_Period = 1s/c_Frequency;

    logic Clk_k = 0;
    logic Reset_r = 1;
    logic [7:0] PortIn_b = 8'b0;
    logic [7:0] PortOut_b;

    task Report(string Text);
        $display("%s (@ %t)", Text, $time);
    endtask;

    top i_Top (
        .Clk_ik(Clk_k),
        .Reset_ir(Reset_r),
        .Port_ib(PortIn_b),
        .Port_ob(PortOut_b)
    );
    
    initial
        forever #(c_Period/2.0) Clk_k = ~Clk_k;

    initial begin
        repeat(4)@(posedge Clk_k);
        Reset_r = 0;
        PortIn_b = 8'b01010101;
        repeat(400)@(posedge Clk_k);
        Report("Testbench ended.");
        $stop();
    end

    initial begin
        #10us;
        Report("Testbench timeouted!");
        $stop();
    end

endmodule