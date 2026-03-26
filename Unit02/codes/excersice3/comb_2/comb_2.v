module comb_2 (
    // ports
    output  o_comb_2,

    input   i_corner_case,
    input   i_fract_integ_s_u

);

assign o_comb_2 = i_corner_case & i_fract_integ_s_u;

endmodule
