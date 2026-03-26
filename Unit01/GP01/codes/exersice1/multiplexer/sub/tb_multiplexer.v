`timescale 1ns/1ps

module tb_multiplexer();

    reg      [3:0] i_0          ;
    reg      [3:0] i_1          ;
    reg      [3:0] i_2          ;

    reg      [1:0] i_sel        ;
    
    wire     [3:0] o_multiplexer;

    integer        k;

multiplexer
    multiplexer(        .o_multiplexer(o_multiplexer),
        .i_0         (i_0)           ,
        .i_1         (i_1)           ,
        .i_2         (i_2)           ,
        .i_sel       (i_sel)
    );

initial begin
    // Monitor values
    $monitor("Time= %0t | i_0= %d | i_1= %d | i_2= %d | o_multiplier= %d", 
            $time, i_0, i_1, i_2, o_multiplexer);

    // Test cases
    i_0   = 4'd0; i_1 = 4'd1; i_2 = 4'd2; #10;
    
    for (k = 0; k < 4; k = k + 1) begin
        i_sel = k[1:0];
        #10;
    end
    
    // i_sel = 2'b00;                        #10;
    // i_sel = 2'b01;                        #10;
    // i_sel = 2'b10;                        #10;

    $finish;

end

endmodule