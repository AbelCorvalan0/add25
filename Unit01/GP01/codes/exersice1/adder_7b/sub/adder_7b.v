module adder_7b(

    // Output.
    output [6:0] o_sum2,

    // Inputs.
    input  [5:0] i_sumA,
    input  [5:0] i_sumB
);

assign o_sum2 = i_sumA + i_sumB;

endmodule