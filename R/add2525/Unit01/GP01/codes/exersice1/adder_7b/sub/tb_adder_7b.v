`timescale 1ns/1ps

module tb_adder_7b();

    wire [6:0] o_sum2;

    reg  [5:0] i_sumA;
    reg  [5:0] i_sumB;

adder_7b
    adder_7b(
        .o_sum2(o_sum2),
        .i_sumA(i_sumA),
        .i_sumB(i_sumB)
    );


initial begin

    // Monitor values
    $monitor("Time = %0t | o_sum2 = %d | i_sumA = %d | i_sumB = %d",
            $time, o_sum2, i_sumA, i_sumB);

    i_sumA = 6'h0F;      //0000 1111
    i_sumB = 6'h2A; #10; //0010 1010

    i_sumA = 6'h1A;    
    i_sumB = 6'h0D; #10;

    $finish;

end

endmodule