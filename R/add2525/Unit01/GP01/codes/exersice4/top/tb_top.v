`timescale 1ns/1ps

module tb_top();

wire signed [10:0] out;

wire signed [7:0]  x1;
wire signed [7:0]  x2;
wire signed [7:0]  x3;

wire signed [10:0] y1;
wire signed [10:0] y2;

reg  signed [7:0]  x;
reg                clk;
reg                rst_n;

always #5 clk = ~clk;

initial begin
    clk   = 0;
    rst_n = 0;
    x    = -8'sd128;

    #20 rst_n = 1;

    // Repeat this block 256 times.
    // Control event on x.
    // This block increment the value of x.
    repeat(256) begin
        @(posedge clk);
        x = x + 1;
    end

    #1000 $stop;
end

top
    top(
        .y(out),
        .x1(x1),
        .x2(x2),
        .x3(x3),
        .y1(y1),   
        .y2(y2),   
        .x(x),
        .clk(clk),
        .rst_n(rst_n)
    );

endmodule