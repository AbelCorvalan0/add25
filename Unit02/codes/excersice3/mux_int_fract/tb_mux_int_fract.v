`timescale 1ns/1ps

module tb_mux_int_fract();

wire signed [31:0] result;

reg signed [31:0] P;  
reg               sel;

// Instantiate the DUT.
mux_int_fract
mux_int_fract1(
    .result(result),
    .P(P),
    .sel(sel)
);

initial begin
        // Monitor signals
        $monitor("time=%0t | sel=%b | P=%0d (0x%h) | result=%0d (0x%h)",
                  $time, sel, P, P, result, result);

        // Test 1
        P   = 32'sd10;
        sel = 1'b0;
        #10;

        sel = 1'b1;
        #10;

        // Test 2 (negative number)
        P   = -32'sd5;
        sel = 1'b0;
        #10;

        sel = 1'b1;
        #10;

        // Test 3 (large value)
        P   = 32'sd100000;
        sel = 1'b0;
        #10;

        sel = 1'b1;
        #10;

        $finish;
    end

endmodule