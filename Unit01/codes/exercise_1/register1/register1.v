module register1(

    // Output.
    output reg [5:0] o_data    , // Output
    output reg       o_overflow, // Overflow

    input  [6:0] i_sum     , // Input
    input        clk       , // Clock Signal
    input        i_rst_n     // Negative Reset Signal

);

    always @(posedge clk or negedge i_rst_n) begin
        if(!i_rst_n)
            o_data     <= 6'b0      ;
            o_overflow <= 1'b0      ; 
        else
            o_data     <= i_sum[5:0];
            o_overflow <= sum[6]    ;
    end

endmodule