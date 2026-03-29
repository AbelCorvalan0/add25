module multiplier #(
    parameter EXP_WIDTH             =  4,
    parameter MANTISSA_WIDTH        =  8,
    parameter BIAS                  =  7
)(
    // Define 13 bit numbers.
    // 1 bit sign + 4 bits for exponent + 8 bits for mantissa.
    // Result
    output [EXP_WIDTH + MANTISSA_WIDTH : 0]        result,
    output                                    sign_result,
    output           [EXP_WIDTH-1      : 0]    exp_result,
    output           [MANTISSA_WIDTH-1 : 0]   mant_result, 
    // Number A.
    input                                           signA,
    input            [EXP_WIDTH-1      : 0]          expA,
    input            [MANTISSA_WIDTH-1 : 0]         mantA,
    // Number B.
    input                                           signB,
    input            [EXP_WIDTH-1      : 0]          expB,
    input            [MANTISSA_WIDTH-1 : 0]         mantB
);

wire                             sign_op;
wire [EXP_WIDTH          : 0]     exp_op;
wire [2*MANTISSA_WIDTH-1 : 0]    mant_op;

assign sign_op   = signA ^ signB ;
assign exp_op    = (expA  + expB) - BIAS ;
assign mant_op   = mantA * mantB ; 

reg  [EXP_WIDTH-1      : 0]  exp_norm;
reg  [MANTISSA_WIDTH-1 : 0] mant_norm;

// Combinational logic. It doesn't depend on clk.
always @(*) begin 
    if (mant_op[15] == 1) begin
        // overflow, then shift right
        mant_norm = mant_op[15:8];    // 8 bits= 15 - 8 + 1;
        exp_norm  = exp_op + 1   ;
        // Why +1 in th exp_norm line?
        // Compensate mantissa overflow in exponent.
        // If we divide mantissa by 2 (shift),
        // We must increase exponent.
        // 
        // (m/2)*2^(e+1) = m*2^(e)
    end else begin
        mant_norm = mant_op[14:7];
        exp_norm  =        exp_op;
    end
end

assign mant_result = mant_norm;
assign exp_result  =  exp_norm;
assign sign_result =   sign_op;
assign result      = {sign_result, exp_result, mant_result};

endmodule