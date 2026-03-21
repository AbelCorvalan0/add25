module multiplier(

    // Define 13 bit numbers.
    // 1 bit sign + 4 bits for exponent + 8 bits for mantissa.

    // Result
    output        sign_result,
    output [3:0]  exp_result,
    output [7:0]  mant_result, 

    // Number A.
    input       signA,
    input [3:0] expA,
    input [7:0] mantA,

    // Number B.
    input       signB,
    input [3:0] expB,
    input [7:0] mantB
);

assign sign_result = signA ^ signB ;
assign exp_result  = expA  + expB  ;
assign mant_result = mantA + mantB ; 

endmodule