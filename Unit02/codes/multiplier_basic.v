module multiplier(
    // Define outputs.
    output [33:0] P,

    // Define inputs.
    input  [16:0] op1, op2
    //input             sel

);

assign P = op1 * op2;

endmodule