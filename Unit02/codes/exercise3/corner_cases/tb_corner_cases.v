`timescale 1ns/1ps

module tb_corner_cases;

reg  [15:0] op1;
reg  [15:0] op2;
wire        o_corner_case;
wire [31:0] partial_result;

    corner_cases dut (
        .o_corner_case(o_corner_case),
        .op1(op1),
        .op2(op2),

        .partial_result(partial_result)
    );

initial begin

    // Test 1 (zero multiplication).
    op1= 16'h0000;
    op2= 16'h0000;
    
    // 10ns.
    #10;
    // Test 2 (+1 multiplication).
    op1= 16'h0001;
    op2= 16'h0001;

    #10;
    // Test 3 (max signed multiplication).
    op1= 16'h7FFF;
    op2= 16'h7FFF;

    #10;
    // Test 4 (2nd max signed multiplication).
    op1= 16'h7FFF;
    op2= 16'h000F;
    #10;
    $finish;
end

endmodule
