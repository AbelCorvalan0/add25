module operations(

    output reg signed [15:0] o_dataC,

    input signed [15:0] i_dataA,
    input signed [15:0] i_dataB,
    input        [1:0]   i_sel
);

always@(*) begin
    case(i_sel)
        2'b00: o_dataC = i_dataA + i_dataB;
        2'b01: o_dataC = i_dataA - i_dataB;
        2'b10: o_dataC = i_dataA & i_dataB;
        2'b11: o_dataC = i_dataA | i_dataB;
    endcase
end

endmodule

