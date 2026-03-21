`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2023 10:06:30
// Design Name: 
// Module Name: SIM_P1_E4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SIM_P1_E4();

reg [7:0] Ent;
wire [7:0] Sal;
reg clk;
reg rst;

initial
begin
      Ent = 8'b00000000;
      clk = 1'b0;
      rst = 1'b0;
end

initial forever #10 Ent = Ent + 1;
initial forever #5 clk = !clk;
initial forever #6 rst =  1'b1;
    
P1_E4 suma(
    .clk(clk),
    .rst(rst),
    .X(Ent),
    .Y(Sal)
    );
    
initial
    #500 $stop;
endmodule
