`timescale 1ns/1ps

module tb_filtro_fir ();

  // ===============================
  // Parameters
  // ===============================
  parameter NB_INPUT   = 16;
  parameter NBF_INPUT  = 15;
  parameter NB_OUTPUT  = 18;
  parameter NBF_OUTPUT = 17;
  parameter NB_COEFF   = 16;
  parameter NBF_COEFF  = 15;

  // ===============================
  // Signals
  // ===============================
  reg tb_clk;
  reg tb_en;
  reg tb_srst;
  reg signed [NB_INPUT-1:0] tb_is_data;
  wire signed [NB_OUTPUT-1:0] tb_os_data;

  // ===============================
  // DUT
  // ===============================
  filtro_fir #(
    .NB_INPUT   (NB_INPUT),
    .NBF_INPUT  (NBF_INPUT),
    .NB_OUTPUT  (NB_OUTPUT),
    .NBF_OUTPUT (NBF_OUTPUT),
    .NB_COEFF   (NB_COEFF),
    .NBF_COEFF  (NBF_COEFF)
  ) dut (
    .clk        (tb_clk),
    .i_en       (tb_en),
    .i_srst     (tb_srst),
    .i_is_data  (tb_is_data),
    .o_os_data  (tb_os_data)
  );

  // ===============================
  // Clock: 25 MHz (40 ns)
  // ===============================
  always #20 tb_clk = ~tb_clk;

  // ===============================
  // Aux variables
  // ===============================
  real r;
  integer n;
  integer aux;

  // ===============================
  // Stimulus
  // ===============================
  initial begin
    tb_clk     = 0;
    tb_en      = 0;
    tb_srst    = 1;
    tb_is_data = 0;

    // -------------------------------
    // Reset sincrónico
    // -------------------------------
    repeat (2) @(posedge tb_clk);
    tb_en   <= 1'b1;
    tb_srst <= 1'b0;

    // -------------------------------
    // Senoide Q1.15
    // Fs = 25 kHz
    // Fin = 1 kHz
    // Amplitud = 0.7
    // -------------------------------
    for (n = 0; n < 4000; n = n + 1) begin

      @(posedge tb_clk);

      r = 0.7 * $sin((2.0*3.1415926*1000.0*10000*n)/(25000.0));
      aux = r * (1<<NBF_INPUT);

      tb_is_data <= aux;

    end

    // -------------------------------
    // End sim
    // -------------------------------
    $finish;
  end

endmodule
