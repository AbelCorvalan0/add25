module top(
    
    output [5:0] o_data    ,
    output       o_overflow,

    input  [2:0] i_data1   ,
    input  [2:0] i_data2   ,
  
    input  [1:0] i_sel     ,
    input        clk       ,
    input        i_rst_n

);

adder_4b
    adder_4b(
        .o_sum1  (o_sum1) ,

        .i_data1 (i_data1),
        .i_data2 (i_data2)
    );

wire [3:0] o_sum1;

wire [3:0] i_0;
// wire [3:0] i_1; // o_sum1
wire [3:0] i_2;

assign i_0 = {1'b0, i_data2};
assign i_2 = {1'b0, i_data1};

multiplexer
    multiplexer(
        .o_multiplexer(o_multiplexer),
        
        .i_0          (i_0)   ,
        .i_1          (o_sum1),
        .i_2          (i_2)   ,
        .i_sel        (i_sel)
    );

wire [3:0] o_multiplexer;

wire [5:0] i_sum2 = {2'b00, o_multiplexer};
//resolver bits desde modelo de la instancia

adder_7b
    adder_7b(
        .o_sum2       (o_sum2)       ,
        .i_sumA       (i_sum2)       ,
        .i_sumB       (o_data) // connect with output of register1.
    );

wire [6:0] o_sum2;

register1
    register1(
        .o_data       (o_data)    ,
        .o_overflow   (o_overflow),
   
        .i_sum        (o_sum2)    ,
        .clk          (clk)       ,
        .i_rst_n      (i_rst_n)
    );

endmodule