module corner_cases (
    // Define outputs.
    output reg    o_corner_case,
    //output [31:0] partial_result,
    input  [15:0] op1, op2
);

//wire [31:0] partial_result;

always @(*) begin
    // Verify Integer multiplication.
    if( !(&partial_result[31 -: 16] ||  ~|partial_result[31 -: 16]) ) begin
        o_corner_case = 1'b1;
    end else begin
        o_corner_case = 1'b0; 
    end
end

//assign partial_result = op1 * op2;

endmodule
