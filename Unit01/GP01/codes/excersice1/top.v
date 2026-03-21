module top #(
    parameter NB_OUTPUT = 8,
    parameter NB_INPUT_DATA = 3,
    parameter NB_SELECT = 2
)(
    output [NB_OUTPUT-1:0] o_data,
    output o_overflow,
    input [NB_INPUT_DATA-1:0] i_data1,
    input [NB_INPUT_DATA-1:0] i_data2,
    input [NB_SELECT-1:0] i_sel,
    input clk,
    input i_rst_n
);

    wire [3:0] connectAdd4b_to_mux2to1;
    wire [5:0] connectMux2to1_to_add6b;
    wire [5:0] connectFeedbackReg_to_add6b;
    wire [6:0] connectAdd6b_to_reg;
    wire [5:0] connectData;
    
    //wire connectOverflow;
    wire [5:0] extended0, extended2;

    assign extended0 = {1'b0, i_data1};
    assign extended2 = {1'b0, i_data2};

    adder_4b u_adder_4b(
        .o_adder0(connectAdd4b_to_mux2to1),
        .i_data1(i_data1),
        .i_data2(i_data2)
    );

    adder_6b u_adder_6b(
        .o_adder1(connectAdd6b_to_reg),
        .i_data1(connectMux2to1_to_add6b),
        .i_data2(connectFeedbackReg_to_add6b)
    );

    mux2to1_6b u_mux2to1_6b(
        .o_mux(connectMux2to1_to_add6b),
        .i_data1(extended0),
        .i_data2(extended2),
        .i_data(connectAdd4b_to_mux2to1),
        .i_sel(i_sel)
    );

    reg6 u_reg6(
        .o_data(connectData),
        .o_overflow(connectOverflow),
        .feedback(connectFeedbackReg_to_add6b),
        .sum(connectAdd6b_to_reg),
        .clk(clk),
        .i_rst_n(i_rst_n)
    );

    assign o_data = connectData;
    //assign o_overflow = connectOverflow;
    assign o_overflow = connectAdd6b_to_reg[6];
    
endmodule