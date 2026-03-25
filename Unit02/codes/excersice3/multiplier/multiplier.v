module multiplier(
    output reg signed [31:0] P,
    output reg signed [33:0] p_result,    // Comment when it's finished.
    output reg               o_overflow,
    // agregar en tb o_overflow
    // agregar en multiplier.v y en tb_top.v
    input                    fract_int,   // integer = 0, fractional = 1
    input      signed [16:0] op1,
    input      signed [16:0] op2
);

    // Full precision product: 17 x 17 = 34 bits
    //reg signed [33:0] p_result;

    always @(*) begin
        // Default
        P = 32'sd0;

        // Multiplication.
        p_result = (op1 * op2) + (34'd1 <<1);

        // Take the 32 MSB from partial result.
        P = p_result[33 -: 32];
        
    end
endmodule
