module adder_4b(
    output [3:0] o_adder0,
    
    input  [2:0] i_data1,
    input  [2:0] i_data2
);
    assign o_adder0 = {1'b0, i_data1} + {1'b0, i_data2};
endmodule