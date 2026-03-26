module top(
    // Output
    output reg signed [11:0]    y,
    // Delayed inputs  
    output reg signed [7:0]    x1,
    output reg signed [7:0]    x2,
    output reg signed [7:0]    x3,
    // Outputs for debug
    output reg signed [10:0]   y1,
    output reg signed [10:0]   y2,
    // Input
    input      signed [7:0]     x,
    input                     clk, 
    input                   rst_n
);

// We need 11 bits to representate 
// -512 to 512
wire signed [11:0] y_o;

// Equation implementation
assign y_o = x - x1 + x2 + x3 + (y1 >>> 1) + (y2 >>> 2);

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        x1 <= 0;
        x2 <= 0;
        x3 <= 0;
        y  <= 0;
        y1 <= 0;
        y2 <= 0;
    end else begin
        // Shift registers for input
        x1 <= x;
        x2 <= x1;
        x3 <= x2;
        // Output
        y <= y_o;
        // Feedback paths
        y1 <= y_o;
        y2 <= y1;
    end
end

endmodule