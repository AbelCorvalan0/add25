module topAdder(

    output reg [16:0] o_sum    ,

    input      [15:0] i_sampleA,
    input      [15:0] i_sampleB,
    input             i_carry  ,
    input             clock    
);

wire [16:0] sum;

always@(posedge clock)
    o_sum <= sum;

`ifdef ADDER_BCLA
    bcla
    u_bcla(
        .a       (i_sampleA),
        .b       (i_sampleB),
        .c_in    (i_carry  ),
        .sum_r   (sum[15:0]),
        .c_out_r (sum[16])  ,
        .clk     (clock)

    );

`elsif ADDER_HCSA
    hierarchicalcsa
    u_hierarchicalcsa(
        .a     (i_sampleA),
        .b     (i_sampleB),
        .cin   (i_carry)  ,
        .sum_r (sum[15:0]),
        c_out_r(sum[16])  ,
    );

`else

    rca
    u_rca(
        .a      (i_sampleA),
        .b      (i_sampleB),
        .cin    (i_carry)  ,
        .s_r    (sum[15:0]),
        .cout_r (sum[16])  ,
        .clk    (clk)
    );

`endif

endmodule