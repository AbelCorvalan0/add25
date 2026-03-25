`timescale 1ns/1ps

module tb_mutiplexer();
    
wire [16:0] o_mux;

reg  [15:0]     a;
reg           sel;      

// Initialize reg values.
initial begin
    a   = 16'hFFFF;
    sel = 1'b1;
    #10;

    sel = 1'b0;
    #10;

    //out = 17'h1FFFF;
end

multiplexer
mux(
    .out(o_mux),
    
    .a  (a),
    .sel(sel)
);


endmodule