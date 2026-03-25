`timescale 1ns / 1ps

module tb_uniform_multiplier_17x17;

    reg [16:0] a;
    reg [16:0] b;
    reg op1_s, op2_s;
    reg op1_f, op2_f;
    reg round;

    wire signed [33:0] mult_result_signed;
    wire signed [31:0] P;
    wire overflow;

    uniform_multiplier_17x17 DUT (
        .mult_result_signed(mult_result_signed),
        .a(a),
        .b(b),
        .op1_s(op1_s),
        .op2_s(op2_s),
        .op1_f(op1_f),
        .op2_f(op2_f),
        .round(round),
        .P(P),
        .overflow(overflow)
    );

    initial begin
        $display("t   a      b      s1 s2 f1 f2 r | mult        P         ovf");

        // Caso 1
        a=10000; b=3;
        op1_s=0; op2_s=0; op1_f=0; op2_f=0; round=0;
        #10 $display("%0t %d %d %b %b %b %b %b | %d %d %b",
                     $time,a,b,op1_s,op2_s,op1_f,op2_f,round,
                     mult_result_signed,P,overflow);

        // Caso 2
        a=20000; b=-2;
        op1_s=1; op2_s=1; op1_f=0; op2_f=0; round=0;
        #10 $display("%0t %d %d %b %b %b %b %b | %d %d %b",
                     $time,a,b,op1_s,op2_s,op1_f,op2_f,round,
                     mult_result_signed,P,overflow);

        // Caso 3 fractional
        a=32767; b=32767;
        op1_s=1; op2_s=1; op1_f=1; op2_f=1; round=1;
        #10 $display("%0t %d %d %b %b %b %b %b | %d %d %b",
                     $time,a,b,op1_s,op2_s,op1_f,op2_f,round,
                     mult_result_signed,P,overflow);

        // Caso 4 overflow
        a=17'h1FFFF; b=17'h1FFFF;
        op1_s=0; op2_s=0; op1_f=0; op2_f=0; round=0;
        #10 $display("%0t %d %d %b %b %b %b %b | %d %d %b",
                     $time,a,b,op1_s,op2_s,op1_f,op2_f,round,
                     mult_result_signed,P,overflow);

        $finish;
    end

endmodule
