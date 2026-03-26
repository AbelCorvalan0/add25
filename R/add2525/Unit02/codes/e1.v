module fp_mult_13b (
    input  [12:0] A,
    input  [12:0] B,
    output [20:0] R
);

    // Desempaquetado
    wire sA = A[12];
    wire sB = B[12];
    wire [3:0] eA = A[11:8];
    wire [3:0] eB = B[11:8];
    wire [7:0] mA = A[7:0];
    wire [7:0] mB = B[7:0];

    // Signo
    wire sR = sA ^ sB;

    // Exponente
    wire [4:0] e_sum;
    wire [4:0] e_bias_removed;

    assign e_sum = eA + eB;
    assign e_bias_removed = e_sum - 5'd7;

    // Mantisa
    wire [15:0] mR;
    assign mR = mA * mB;

    // Empaquetado salida
    // R = [signo | exponente (4 bits) | mantisa (16 bits)]
    assign R = {sR, e_bias_removed[3:0], mR};

endmodule
