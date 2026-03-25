module multiplier(
    // Outputs
    //output reg signed [16:0] result_multiplier,
    //output reg               overflow,

    output reg signed [31:0] P,  

    // Inputs
    input  signed [16:0] op1,
    input  signed [16:0] op2
);

    reg signed [33:0] p_result;
    //reg signed [33:0] p_result;
    // Integer Signed X Signed.
    always @(*) begin
        p_result = op1 * op2;
        P = p_result[31:0];
    end
        // // Check redundant sign bits [33:17]
        // if ( (~|p_result[33 -: 17]) || (&p_result[33 -: 17]) ) begin
        //     // No overflow
        //     result_multiplier = p_result[16:0];
        //     overflow = 1'b0;
        // end
        // else begin
        //     // Overflow → saturate
        //     result_multiplier = p_result[33] ? 17'sh10000 : 17'sh0FFFF;
        //     overflow = 1'b1;
        // end
    //end

endmodule
