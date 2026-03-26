`timescale 1ns/1ps

module tb_multiplier;

    reg  signed [16:0] op1, op2;
    //wire signed [16:0] result_multiplier;
    //wire               overflow;
    wire signed [31:0] P;

    initial begin
        
        // Test cases
        op1 = 0;         op2 = 0;         #10;
        op1 = 5;         op2 = 3;         #10;
        op1 = 123;       op2 = 0;         #10;
        op1 = 16'shFFFF; op2 = 16'shFFFF; #10;
        op1 = 1000;      op2 = 2000;      #10;
        op1 = 54321;     op2 = 12345;     #10;
        op1 = -1;        op2 = -1;        #10;
        
        $monitor("time=%0t | op1=%0d | op2=%0d | P=%0d ",
                  $time, op1, op2, P);

        $finish;
    end

    // DUT
    multiplier multiplier1 (
        .P(P),
        .op1(op1),
        .op2(op2)
    );

endmodule
