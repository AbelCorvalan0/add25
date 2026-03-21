`timescale 1ps/1ps

module tb_operations();

    wire signed [15:0] o_dataC;

    reg signed [15:0] i_dataA;
    reg signed [15:0] i_dataB;
    reg signed [1:0]   i_sel;



initial begin
    //i_dataA    =   16'h0002;
    //i_dataB    =   16'hFFFF; // -1
    //i_dataA    =   16'sd2;
    //i_dataB    =   16'sd-6; // -1
    i_dataA = 16'h0002;  // 2 en hexadecimal
    i_dataB = 16'hFFFA;  // -6 en complemento a 2 (equivale a -6)
    i_sel      =   2'b00;
    #1 i_sel   =   2'b01;
    #1 i_sel   =   2'b10;
    #1 i_sel   =   2'b11;
    #1 $finish;
end

operations op1 (
    .o_dataC(o_dataC),
    .i_dataA(i_dataA),
    .i_dataB(i_dataB),
    .i_sel(i_sel)
);


endmodule

