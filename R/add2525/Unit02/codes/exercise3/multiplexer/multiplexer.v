module multiplexer(

    // Define outputs.
    // Signed output. 
    output signed [16:0] out, 

    // Define inputs.           
    input         [15:0] a,
    input                sel
);

wire o_multiplexer;


assign o_multiplexer = (sel == 1'b1)?
                        a[15] :
                        1'b0  ;

assign out = {o_multiplexer, a};

endmodule