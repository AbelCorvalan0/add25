module mux2to1_6b(
    output reg [5:0] o_mux,
    
    input [5:0] i_data1,
    input [5:0] i_data2,
    input [5:0] i_data,
    input [1:0] i_sel
);
    always @(*) begin
        case (i_sel)
            2'b00: o_mux = i_data1;
            2'b01: o_mux = i_data;
            2'b10: o_mux = i_data2;
            default: o_mux = 4'b0000;
        endcase
    end
endmodule