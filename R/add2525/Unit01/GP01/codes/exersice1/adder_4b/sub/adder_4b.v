module adder_4b(

    // Outputs.
    output wire [3:0]  o_sum1,

    // Inputs.
    input  wire [2:0] i_data1,
    input  wire [2:0] i_data2  

);

assign o_sum1 = i_data1 + i_data2;

endmodule