`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2023 09:51:15
// Design Name: Bruno Bertotti
// Module Name: P1_E4
// Project Name: Práctico #1 ejeccicio 4
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


module P1_E4(
    input clk,
    input rst,
    input [7:0] X,
    output reg [7:0] Y
    );

reg [7:0] x1, x2, x3, x4 ,x5;
wire [7:0] sal_p;
assign sal_p = X - x1 + x2 + x3 + x4 + x5 ;

always @(posedge clk)
begin
    if(rst == 1'b1)
    begin
        x1 <= X;
        x2 <= x1;
        x3 <= x2;
        x4 <= {1'b0 , x1[7:1]};
        x5 <= {2'b00, x2[7:2]};
        Y <= sal_p;
     end else begin
        x1 <= 8'H00;
        x2 <= 8'H00;
        x3 <= 8'H00;
        x4 <= 8'H00;
        x5 <= 8'H00;
        Y  <= 8'H00;
     end
end
endmodule
