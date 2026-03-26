module multiplexer(

    // Outputs.
    output wire [3:0]  o_multiplexer,

    // Inputs.
    input  wire [3:0] i_0,
    input  wire [3:0] i_1,
    input  wire [3:0] i_2,  

);

always(*) begin
    case (i_sel)
        2'b00:   o_multiplexer = i_0;
        2'b01:   o_multiplexer = i_1; 
        2'b10:   o_multiplexer = i_2;
        default: o_multiplexer = 4'b0000;
    endcase
end

endmodule