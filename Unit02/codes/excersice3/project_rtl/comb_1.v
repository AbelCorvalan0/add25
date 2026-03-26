module comb_1(
    output o_and3,

    input  fract_int,
    input  sig_unsig_op1,
    input  sig_unsig_op2
);

assign o_and3 = fract_int & sig_unsig_op1 & sig_unsig_op2;

endmodule
