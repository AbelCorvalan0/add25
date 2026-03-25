module top (
    // ports
    output signed [31:0] o_unified_mult,

    input  signed [15:0] a,
    input  signed [15:0] b,
    input                sel0,
    input                sel1,

    // Input combinational 1 (comb_1)
    input                fract_int
    // input                sig_unsig_op1,
    // input                sig_unsig_op2
);

///// multiplexer signed/unsigned /////
wire signed [16:0] o_multiplexer0;
wire signed [16:0] o_multiplexer1;

///// multiplier /////
// wires for multiplier.
wire signed [31:0] o_multiplier;
wire               fract_int;
// Review

///// mux_int_fract /////
// wires for mux_int_fract.
wire signed [31:0] o_fisu0;

///// comb_1 /////
wire               o_and3;

///// mux_sat /////
//wire        [31:0] P; 

///// comb_2 /////
//wire               o_comb_2;

///// corner_cases /////
//wire               o_corner_case;

multiplexer
multiplexer0 (
    .out (o_multiplexer0),
    .a   (a),
    .sel (sel0)
);

multiplexer
multiplexer1 (
    .out (o_multiplexer1),
    .a   (b),
    .sel (sel1)   
);

multiplier
multiplier0(
    .fract_int (fract_int),
    .P         (o_multiplier),
    .op1       (o_multiplexer0),
    .op2       (o_multiplexer1)
);

mux_int_fract
mux_int_fract0(
    .result (o_fisu0),
    .P      (o_multiplier),
    .sel    (o_and3) 
);

comb_1
comb_1_0(
    .o_and3        (o_and3),
    .fract_int     (fract_int),
    .sig_unsig_op1 (sel0),
    .sig_unsig_op2 (sel1)
);

// mux_sat
// mux_sat0(
//     .P        (P),
//     .i_result (o_fisu0),
//     .sel      (o_comb_2)
// );

// comb_2
// comb_2_0(
//     .o_comb_2          (o_comb_2),
//     .i_corner_case     (o_corner_case),
//     .i_fract_integ_s_u (o_and3)
// );

// corner_cases
// corner_cases0(
//     .o_corner_case(o_corner_case),
//     .op1(a),
//     .op2(b)
// );

assign o_unified_mult = o_fisu0;
assign p_result1 = p_result;
endmodule
