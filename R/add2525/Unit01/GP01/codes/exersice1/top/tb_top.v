`timescale 1ns/1ps

module tb_top();

wire [5:0] o_data    ;
wire       o_overflow;

reg  [2:0] i_data1   ;
reg  [2:0] i_data2   ;

reg  [1:0] i_sel     ;
reg        clk       ;
reg        i_rst_n   ;

top
    top(
        .o_data     (o_data)    ,
        .o_overflow (o_overflow),

        .i_data1    (i_data1)   ,
        .i_data2    (i_data2)   ,
        .i_sel      (i_sel)     ,   
        .clk        (clk)       ,
        .i_rst_n    (i_rst_n)
    );


initial begin
    clk     = 1'b0;
    i_data1 = 3'b000;
    i_data2 = 3'b000;
    i_sel   = 2'd0;
    i_rst_n = 1'b1;
end

always begin
    #5 clk = ~clk;
end

initial begin

    #10 i_data1 = 3'd2; i_data2 = 3'd2; 
    #10 i_data1 = 3'd1; i_data2 = 3'd1;
    #2 i_rst_n  = 1'b0;

    #10 i_data1 = 3'd5; i_data2 = 3'd5;
    #10 i_data1 = 3'd5; i_data2 = 3'd5;

    #4  i_rst_n = 1'b1;
    #10 i_sel   = 2'd1;
    #5  i_data1 = 3'd1; i_data2 = 3'd1;  
    
    #30;

    $finish;

end


endmodule