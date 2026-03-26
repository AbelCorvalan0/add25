`timescale 1ns/1ps

module tb_multiplier;

reg signA, signB;
reg [3:0] expA, expB;
reg [7:0] mantA, mantB;

wire sign_result;
wire [3:0] exp_result;
wire [7:0] mant_result;

multiplier_fp13 uut (
    .signA(signA),
    .expA(expA),
    .mantA(mantA),
    .signB(signB),
    .expB(expB),
    .mantB(mantB),
    .sign_result(sign_result),
    .exp_result(exp_result),
    .mant_result(mant_result)
);

initial begin
    // Test 1
    signA = 0; expA = 4'd3; mantA = 8'd10;
    signB = 0; expB = 4'd2; mantB = 8'd5;
    #10;

    // Test 2
    signA = 1; expA = 4'd4; mantA = 8'd20;
    signB = 0; expB = 4'd3; mantB = 8'd3;
    #10;

    // Test 3
    signA = 1; expA = 4'd7; mantA = 8'd50;
    signB = 1; expB = 4'd2; mantB = 8'd2;
    #10;

    $finish;
end

endmodule