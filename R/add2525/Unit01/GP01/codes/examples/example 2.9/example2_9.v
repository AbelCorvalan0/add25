// y[n]= 0.5 y[n-1] + x[n]

module iir
(
    output reg signed [31:0]       y,

    input signed      [15:0]       x,
    input                        clk,
    input                      rst_n
);

    always @(*) // combinational logic block.
        y <= (y_reg >>> 1) + x;
        always @(posedge clk or negedge rst_n)  // sequential logic block
        begin
            if (!rst_n)
                y_reg <= 0;
            else
                y_reg <= y;
        end
endmodule 