`timescale 1ns/1ps

module tb_top;
    reg clk;
    reg i_rst_n;
    reg [2:0] i_data1, i_data2;
    reg [1:0] i_sel;
    wire [5:0] o_data;
    wire o_overflow;

    reg [3:0] k   = 4'b0000;      // Missing declarations
    reg [1:0] pair= 2'b00;        // Missing declaration for 'pair'

    
    top uut (
        .o_data(o_data),
        .o_overflow(o_overflow),
        .i_data1(i_data1),
        .i_data2(i_data2),
        .i_sel(i_sel),
        .clk(clk),
        .i_rst_n(i_rst_n)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        i_rst_n = 0;
        i_data1 = 0;
        i_data2 = 0;
        i_sel = 0;
        
        #5 i_rst_n = 1;
        

        //for (k = 0; k < 4; k = k + 1) begin
            //@(posedge clk);
            //pair    = k[1:0]; 
            //i_data1 = pair[0];
            //i_data2 = pair[1];

            //if (k < 3)
                //i_sel = k[1:0];
            //else
                //i_sel = 2;   // cuando k = 3, i_sel se queda en 2
        //end




        //#1230 $finish;
        //#1500 $finish;
        #900 $finish;
    end
    
always begin
    for (k = 0; k < 4; k = k + 1) begin
       @(posedge clk);
       pair    = k[1:0]; 
       i_data1 = pair[0];
       i_data2 = pair[1];

        //if (k < 3)
            //i_sel = k[1:0];
        //else
            //i_sel = 2;
        if (k < 3)
                i_sel = k[1:0];  // Valores: 0, 1, 2
            else
                i_sel = 0;
            
        
    end
end

    
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_top);
        $monitor("Time=%t, i_data1=%d, i_data2=%d, i_sel=%b, o_data=%d, o_overflow=%b", 
                 $time, i_data1, i_data2, i_sel, o_data, o_overflow);
    end
endmodule