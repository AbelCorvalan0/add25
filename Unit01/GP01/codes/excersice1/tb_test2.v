`timescale 1ns/1ps

module tb_top;
    reg                     clk;
    reg                 i_rst_n;
    reg  [2:0] i_data1, i_data2;
    reg  [1:0]            i_sel;
    wire [5:0]           o_data;
    wire             o_overflow;
    
    top uut (
        .o_data         (o_data),
        .o_overflow (o_overflow),
        .i_data1       (i_data1),
        .i_data2       (i_data2),
        .i_sel           (i_sel),
        .clk               (clk),
        .i_rst_n       (i_rst_n)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        clk     =       0;
        i_rst_n =       0;
        i_data1 = 4'b0001;
        i_data2 = 4'b0001;
        i_sel   =       1;
        
        #5 i_rst_n =    1;

        #330 $finish;
    end
    
always begin
    @(posedge clk); 
    i_data1 =       1;
    i_data2 =       1;
    i_sel   =  4'b001;
end

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_top);
        $monitor("Time=%t, i_data1=%d, i_data2=%d, i_sel=%b, o_data=%d, o_overflow=%b", 
                 $time, i_data1, i_data2, i_sel, o_data, o_overflow);
    end
endmodule