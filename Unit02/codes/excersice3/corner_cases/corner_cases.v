module corner_cases (
    output               o_corner_case,
    output        [31:0] partial_result, // 
    input         [15:0] op1,
    input         [15:0] op2
);

    //wire [31:0] partial_result;

    assign partial_result = op1 * op2;
    assign o_corner_case  = ( (partial_result != 32'h40000000) ) ? 1'b1 : 
                                                                   1'b0 ;

endmodule
