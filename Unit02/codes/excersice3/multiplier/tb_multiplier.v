`timescale 1ns/1ps

module tb_top;

    // DUT outputs
    wire signed [31:0] P;
    wire signed [33:0] p_result;
    wire               o_overflow;     

    // DUT inputs
    reg  signed [16:0] a; 
    reg  signed [16:0] b;
    reg                fract_int;  // ERROR: was defined but declared as "frac_int" later

    // Instantiate DUT
    multiplier dut (
        .o_overflow(o_overflow),
        .p_result  (p_result),
        .P         (P),
        .op1       (a),
        .op2       (b),
        .fract_int (fract_int)
    );

    integer i;

    initial begin
        // ===============================
        // Initial values (FIXED)
        // ===============================

        // Test 1
        // UxU, Integer
        for ( i=0 ; i < 2 ; i=i+1 ) begin  
            fract_int = i[0];  // FIXED: Was "frac_int" and k should be indexed or truncated
            a = 16'hFFFF;
            b = 16'hFFFF;
            #10;
            //fract_int = 1'b1;
            a = 16'h0000;
            b = 16'h0000;
            // 10ns.
            #10;
            // Test 2 (+1 multiplication).
            a = 16'h0001;
            b = 16'h0001;
            #10;
            // Test 3 (max signed multiplication).
            a = 16'h7FFF;
            b = 16'h7FFF;
            #10;
            // Test 4 (2nd max signed multiplication).
            a = 16'h7FFF;
            b = 16'h000F;
            #20;
        end

        $finish;
    end

endmodule