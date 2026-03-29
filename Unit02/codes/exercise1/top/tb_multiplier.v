`timescale 1ns/1ps

module multiplier_tb;

    // Parameters (match DUT)
    parameter EXP_WIDTH      = 4;
    parameter MANTISSA_WIDTH = 8;
    parameter BIAS           = 7;

    // Inputs (reg)
    reg signA;
    reg [EXP_WIDTH-1:0] expA;
    reg [MANTISSA_WIDTH-1:0] mantA;

    reg signB;
    reg [EXP_WIDTH-1:0] expB;
    reg [MANTISSA_WIDTH-1:0] mantB;

    // Outputs (wire)
    wire [EXP_WIDTH + MANTISSA_WIDTH : 0] result;
    wire sign_result;
    wire [EXP_WIDTH-1:0] exp_result;
    wire [MANTISSA_WIDTH-1:0] mant_result;

    // Instantiate DUT
    multiplier #(
        .EXP_WIDTH(EXP_WIDTH),
        .MANTISSA_WIDTH(MANTISSA_WIDTH),
        .BIAS(BIAS)
    ) multiplier (
        .result(result),
        .sign_result(sign_result),
        .exp_result(exp_result),
        .mant_result(mant_result),
        .signA(signA),
        .expA(expA),
        .mantA(mantA),
        .signB(signB),
        .expB(expB),
        .mantB(mantB)
    );

    // Test procedure
    initial begin

        // Test 1
        signA = 0; expA = 4'd7; mantA = 8'd128; // ~1.0
        signB = 0; expB = 4'd7; mantB = 8'd128; // ~1.0
        #10;

        // Test 2 (different signs)
        // mant_op[15] == 1
        // negative result
        signA = 0; expA = 4'd8; mantA = 8'd150;
        signB = 1; expB = 4'd6; mantB = 8'd120;
        #10;

        // Test 3 (overflow case)
        // mant_op[15] == 1
        signA = 0; expA = 4'd10; mantA = 8'd200;
        signB = 0; expB = 4'd10; mantB = 8'd200;
        #10;

        // Test 4 (zero case)
        signA = 0; expA = 0; mantA = 0;
        signB = 0; expB = 0; mantB = 0;
        #10;

        // Finish simulation
        $finish;
    end

endmodule