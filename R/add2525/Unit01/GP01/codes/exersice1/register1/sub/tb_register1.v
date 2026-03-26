`timescale 1ns/1ps

module tb_register1();

wire [5:0] o_data    ; // Output
wire       o_overflow; // Overflow

reg  [6:0] i_sum     ; // Input
reg        clk       ;  // Clock Signal
reg        i_rst_n   ;  // Negative Reset Signal



register1
    register1(
        .o_data     (o_data),
        .o_overflow (o_overflow),
        .i_sum      (i_sum),
        .clk        (clk),
        .i_rst_n    (i_rst_n)
    );

initial begin
    clk = 1'b0;
end

always begin
    #5 clk = ~clk;
end

initial begin
    
    i_rst_n = 1'b1;
    //i_sum   = 7'b0000000;
    i_sum   = 7'd0;
    #10
    // #12
    // i_rst_n = 1'b0;

    // pruebas
    #20 i_sum = 7'b0001010; // 10
    #20 i_sum = 7'b0111111; // 63
    #20 i_sum = 7'b1000000; // overflow
    #3  i_rst_n = 1'b0;
    #20 i_sum = 7'b1111111; // overflow máximo

    #20 $finish;
end

endmodule