`timescale 1ns/1ps

module tb_top;

    // DUT outputs
    wire signed [31:0] o_unified_mult;

    // DUT inputs
    reg  signed [15:0] a; 
    reg  signed [15:0] b;
    reg                sel0;
    reg                sel1;
    reg                fract_int;  // ERROR: was defined but declared as "frac_int" later

    // Instantiate DUT
    top dut (
        .o_unified_mult (o_unified_mult),
        .a              (a),
        .b              (b),
        .sel0           (sel0),
        .sel1           (sel1),
        .fract_int      (fract_int)
    );

    integer i;
    integer k;

    initial begin
        // ===============================
        // Initial values (FIXED)
        // ===============================

        // Test 1
        // UxU, Integer
        for ( i=0 ; i < 4 ; i=i+1 ) begin  
            for ( k=0 ; k < 3 ; k= k+1 ) begin
                // sel0 = 1'b0;  // COMMENTED
                // sel1 = 1'b0;  // COMMENTED
                { sel0, sel1 } = i[1:0];  // FIXED: Should be just i, not i[1:0]
                //fract_int = 1'b0;
                fract_int = k[0];  // FIXED: Was "frac_int" and k should be indexed or truncated

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
                #10;

                #10;
            end
        end

        // // Sweep sel0 / sel1
        // for (i = 0; i < 4; i = i + 1) begin
        //     a         = 16'sd1;
        //     b         = 16'sd1;            
        //     {sel0, sel1} = i[1:0];
        //     #10;
        // end
        // fract_int = 1'b0;
        // #10;
        
        // ===============================
        // New stimulus
        // ===============================

        //fract_int = 1'b0;

        // for (i = 0; i < 4; i = i + 1) begin
        //     a         = 16'shFFFF;
        //     b         = 16'sh7FFF;
        //     {sel0, sel1} = i[1:0];
        //     fract_int = 1'b1;
        //     #10;
        // end

        // #10;
        $finish;
    end

    // Debug monitor
    // FIXED monitor (fract_int REMOVED)
    initial begin
        $monitor(
            "t=%0t | a=%d b=%d sel0=%b sel1=%b fract_int=%b | out=%d",
            $time, a, b, sel0, sel1, fract_int, o_unified_mult  // FIXED: added fract_int to monitor
        );
    end

endmodule