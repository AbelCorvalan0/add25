module adder_6b(
    output [6:0] o_adder1,

    input  [3:0] i_data1,
    input  [5:0] i_data2 // feedback
);
    assign o_adder1 = {{3'b0}, i_data1} + {{1'b0}, i_data2};
endmodule