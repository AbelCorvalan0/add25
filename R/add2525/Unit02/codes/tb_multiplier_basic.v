`timescale 1ns/1ps

module tb_multiplier;

reg  [16:0]  op1, op2;
//reg        sel;
wire [33:0]  P;

// initial begin
//     op1 = 17'h1FFFF;
//     op2 = 17'h1FFFF;

//     //sel = 1'b0;
// end

    initial begin
        // Monitor changes
        $monitor("time=%0t | op1=%0d | op2=%0d | P=%0d",
                  $time, op1, op2, P);

        // Test 1: zero
        op1 = 0;
        op2 = 0;
        #10;

        // Test 2: small numbers
        op1 = 5;
        op2 = 3;
        #10;

        // Test 3: one operand zero
        op1 = 123;
        op2 = 0;
        #10;

        // Test 4: max values (17-bit)
        op1 = 17'h1FFFF;  // 131071
        op2 = 17'h1FFFF;  // 131071
        #10;

        // Test 5: random values
        op1 = 17'd1000;
        op2 = 17'd2000;
        #10;

        op1 = 17'd54321;
        op2 = 17'd12345;
        #10;

        op1 = 17'h1FFFF;
        op2 = 17'h1FFFF;
        #10;

        // End simulation
        $finish;
    end

// Instantiate the DUT (Device Under Test).
multiplier
multiplier1(
    .P(P),
    .op1(op1),
    .op2(op2)
);

endmodule