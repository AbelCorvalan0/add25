`timescale 1ns / 1ps

module tb_top();

// ========================
// Señales
// ========================
wire signed [10:0] out;

wire signed [7:0] x1;
wire signed [7:0] x2;
wire signed [7:0] x3;

wire signed [10:0] y1;
wire signed [10:0] y2;

reg  signed [7:0] in;
reg clk;
reg rst_n;

// ========================
// Clock (10ns period)
// ========================
always #5 clk = ~clk;

// ========================
// Estímulo
// ========================
initial begin
    clk   = 0;
    rst_n = 0;
    in    = -8'sd128;

    #20 rst_n = 1;

    repeat(256) begin
        @(posedge clk);
        in = in + 1;
    end

    #100 $stop;
end

// ========================
// Instanciación DUT
// ========================
top dut (
    .y(out),
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .y1(y1),   // 👈 nuevas conexiones
    .y2(y2),   // 👈 nuevas conexiones
    .x(in),
    .clk(clk),
    .rst_n(rst_n)
);

// ========================
// Monitor
// ========================
initial begin
    $monitor("t=%0t | x=%0d | y=%0d | x1=%0d x2=%0d x3=%0d | y1=%0d y2=%0d",
             $time, in, out, x1, x2, x3, y1, y2);
end

endmodule