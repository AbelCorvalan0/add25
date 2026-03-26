`timescale 1ns/1ps

module tb_multiplier;

    // DUT inputs
    reg signed [16:0] op1;
    reg signed [16:0] op2;

    // DUT output
    wire signed [31:0] P;

    // Reference model
    reg signed [33:0] ref_full;
    reg signed [31:0] ref_P;

    integer i;

    // Instantiate DUT
    multiplier dut (
        .op1(op1),
        .op2(op2),
        .P  (P)
    );

    // Task to apply stimulus and check result
    task check_mult;
        input signed [16:0] a;
        input signed [16:0] b;
        begin
            op1 = a;
            op2 = b;
            #1; // allow combinational settle

            ref_full = a * b;
            ref_P    = ref_full[31:0];

            if (P !== ref_P) begin
                $display("ERROR: op1=%0d op2=%0d | Expected=%0d Got=%0d",
                         a, b, ref_P, P);
            end else begin
                $display("PASS : op1=%0d op2=%0d | P=%0d",
                         a, b, P);
            end
        end
    endtask

    initial begin
        $display("====================================");
        $display(" Starting multiplier testbench ");
        $display("====================================");

        // Basic tests
        check_mult(17'sd0,      17'sd0);
        check_mult(-17'sd1,     -17'sd1);
        check_mult(17'sd1,      17'sd1);
        check_mult(17'sd2,      17'sd3);
        check_mult(-17'sd1,     17'sd1);
        check_mult(-17'sd5,    -17'sd7);
        check_mult(17'sd1234,  -17'sd4321);

        // Boundary values
        check_mult(17'sd65535,  17'sd1);     // max positive
        check_mult(-17'sd65536, 17'sd1);     // max negative
        check_mult(17'sd65535, -17'sd65536);
        check_mult(-17'sd65536,-17'sd65536);

        // Random tests
        for (i = 0; i < 50; i = i + 1) begin
            check_mult($random, $random);
        end

        $display("====================================");
        $display(" Testbench finished ");
        $display("====================================");

        $finish;
    end

endmodule
