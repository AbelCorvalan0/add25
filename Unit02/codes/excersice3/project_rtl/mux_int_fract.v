module mux_int_fract(
    // Define outputs.
    output reg signed [31:0] result,

    // Define inputs.
    input      signed [31:0] P,
    input                    sel
);

always @(*) begin
    case(sel)
        1'b0: result = P;
        1'b1: result = {{P[30:0]}, 1'b0};
    endcase
end

endmodule