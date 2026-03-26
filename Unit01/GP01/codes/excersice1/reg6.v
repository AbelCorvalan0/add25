module reg6(
    output [5:0] o_data,
    output       o_overflow,
    output [5:0] feedback,

    input  [6:0]     sum,
    input            clk,
    input        i_rst_n

);
    //reg [5:0] data_reg;
    // always @(posedge clk or negedge i_rst_n) begin
    //     if (!i_rst_n)
    //         data_reg <= 6'b0;
    //     else
    //         data_reg <= sum[5:0];
    // end
    // Registro de 7 bits con reset asíncrono
    
    reg [5:0] data_reg;
    reg       overflow_reg;
    
    always @(posedge clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            data_reg     <= 6'b0;
            overflow_reg <= 1'b0;
        end else begin
            data_reg     <= sum[5:0];      // Guarda los 6 bits de datos
            overflow_reg <=   sum[6];      // Guarda el bit de overflow
        end
    end

    assign o_data     = data_reg;
    assign o_overflow = overflow_reg;
    assign feedback   = data_reg;      // Feedback del registro actual

endmodule