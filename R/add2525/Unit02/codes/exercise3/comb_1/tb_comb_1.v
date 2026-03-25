`timescale 1ns/1ps

module tb_comb_1;

    reg fract_int;
    reg sig_unsig_op1;
    reg sig_unsig_op2;
    wire o_and3;

    integer i;

    // Instantiate DUT
    comb_1 dut (
        .o_and3(o_and3),
        .fract_int(fract_int),
        .sig_unsig_op1(sig_unsig_op1),
        .sig_unsig_op2(sig_unsig_op2)
    );

    initial begin
        $display(" time | fract_int sig1 sig2 | o_and3");
        $display("-----------------------------------");
        $monitor("%4t |     %b        %b    %b  |   %b",
                 $time, fract_int, sig_unsig_op1, sig_unsig_op2, o_and3);

        // Iterate through all 3-bit combinations
        for (i = 0; i < 8; i = i + 1) begin
            {fract_int, sig_unsig_op1, sig_unsig_op2} = i[2:0];
            #10;
        end

        $finish;
    end

endmodule
