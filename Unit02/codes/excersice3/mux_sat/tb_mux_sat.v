`timescale 1ns/1ps

module tb_mux_sat;

    reg  [31:0] i_result;
    reg         sel;
    wire [31:0] P;

mux_sat dut (
    .P        (P),
    .i_result (i_result),
    .sel      (sel)
);

    initial begin
        i_result = 32'h11111111;
        sel      = 1'b0;

        #10;
        sel      = 1'b1;
        #10;
        $finish;
    end

endmodule
