`timescale 1ns/1ps

module tb_comb_2;

wire o_comb_2;

reg i_corner_case;
reg i_fract_integ_s_u;

integer i;

    comb_2 dut (
        .o_comb_2(o_comb_2),
        .i_corner_case(i_corner_case),
        .i_fract_integ_s_u(i_fract_integ_s_u)
    );

initial begin
    for( i = 0; i < 4; i = i + 1 ) begin
        {i_corner_case, i_fract_integ_s_u} = i[1:0];
        #10;
    end
    $finish;
end

endmodule
