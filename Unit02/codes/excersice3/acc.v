module uniform_multiplier_17x17 (
    output signed [33:0] mult_result_signed,
    input  [16:0] a,
    input  [16:0] b,
    input         op1_s,
    input         op2_s,
    input         op1_f,
    input         op2_f,
    input         round,
    output signed [31:0] P,
    output        overflow
);

    // -------------------------------------------------
    // Extensión de signo correcta
    // -------------------------------------------------
    wire signed [16:0] a_ext = op1_s ? a : {1'b0, a[15:0]};
    wire signed [16:0] b_ext = op2_s ? b : {1'b0, b[15:0]};

    // -------------------------------------------------
    // Multiplicación 17x17 → 34 bits
    // -------------------------------------------------
    assign mult_result_signed = a_ext * b_ext;

    // -------------------------------------------------
    // Ajuste fractional
    // Q1.15 × Q1.15 → Q2.30 → shift 15
    // -------------------------------------------------
    wire signed [33:0] mult_adjusted =
        (op1_f & op2_f) ? (mult_result_signed >>> 15)
                        : mult_result_signed;


    // -------------------------------------------------
    // Truncamiento / Redondeo a 32 bits
    // -------------------------------------------------
    reg signed [31:0] P_reg;
    reg ovf_reg;

    always @* begin
        ovf_reg = 0;

        if (round) begin
            P_reg = mult_adjusted[33:2] + mult_adjusted[1];
        end else begin
            P_reg = mult_adjusted[33:2];
        end

        // Overflow real: bits descartados ≠ extensión del signo
        if (mult_adjusted[33:32] != {2{mult_adjusted[31]}})
            ovf_reg = 1;
    end

    assign P = P_reg;
    assign overflow = ovf_reg;

endmodule
