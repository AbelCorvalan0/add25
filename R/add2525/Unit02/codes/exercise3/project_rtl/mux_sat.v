module mux_sat(
    output reg signed [31:0] P,
    input             [31:0] i_result,
    input                    sel
);

always @(*) begin
    case (sel)
        1'b0: P = 32'h7FFFFFFF;
        1'b1: P = i_result;
        //default: P = 32'h7FFFFFFF;
    endcase
end

endmodule

