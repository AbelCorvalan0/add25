`timescale 1ns/1ps

module tb4_top();

wire [5:0] o_data;
wire       o_overflow;

reg  [2:0] i_data1;
reg  [2:0] i_data2;

reg  [1:0] i_sel;
reg        clk;
reg        i_rst_n;

top 
    top(
        .o_data     (o_data),
        .o_overflow (o_overflow),
        .i_data1    (i_data1),
        .i_data2    (i_data2),
        .i_sel      (i_sel),
        .clk        (clk),
        .i_rst_n    (i_rst_n)
    );

initial begin

    // initialize signals
    clk     = 0;
    i_rst_n = 0;
    i_data1 = 0;
    i_data2 = 0;
    i_sel   = 0;

    // release reset
    #5 i_rst_n = 1;

    // stimulus
    i_data1 = 3'b001;
    i_data2 = 3'b001;
    i_sel   = 2'b01;

    #450 $finish;
end

always #5 clk = ~clk;

endmodule