module top(
    
    output [5:0] o_data  ,
    output       overflow,

    input  [2:0] i_data1 ,
    input  [2:0] i_data2 ,

    input  [1:0] i_sel   ,
    input        clk     ,
    input        i_rst_n

);

// wire i_data1;

// sum1
//     sum1(
//         .o_sum1  (o_sum1),

//         .i_data1 (i_data1),
//         .i_data2 (i_data2)
//         );

endmodule