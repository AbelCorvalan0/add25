`timescale 1ns / 1ps

module tb_fp_mult_13b;

    reg  [12:0] A, B;
    wire [20:0] R;

    fp_mult_13b DUT (
        .A(A),
        .B(B),
        .R(R)
    );

    initial begin
        // Caso 1: positivo × positivo
        A = {1'b0, 4'd8, 8'd10};   // + mantisa 10
        B = {1'b0, 4'd7, 8'd20};    // + mantisa 5
        #10;

        // Caso 2: negativo × positivo
        A = {1'b1, 4'd9, 8'd20};
        B = {1'b0, 4'd6, 8'd3};
        #10;

        // Caso 3: negativo × negativo
        A = {1'b1, 4'd10, 8'd15};
        B = {1'b1, 4'd8, 8'd4};
        #10;

        // Caso 4: cero en mantisa
        A = {1'b0, 4'd7, 8'd0};
        B = {1'b0, 4'd7, 8'd25};
        #10;

        $stop;
    end

endmodule