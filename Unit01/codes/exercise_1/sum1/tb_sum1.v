`timescale 1ns/1ps

module tb_sum1();

    reg  [2:0] i_data1;
    reg  [2:0] i_data2;

    wire [3:0] o_sum1;

sum1
    sum1(
        .o_sum1 (o_sum1) ,
        .i_data1(i_data1),
        .i_data2(i_data2)
    );

initial begin
  
    // Monitor values
    $monitor("Time= %0t | i_data1= %d | i_data2= %d | o_sum1 = %d",
            $time, i_data1, i_data2, o_sum1);

    // Test cases
    i_data1 = 0; i_data2 = 0; #10;
    i_data1 = 1; i_data2 = 2; #10;
    i_data1 = 3; i_data2 = 4; #10;
    i_data1 = 7; i_data2 = 7; #10; // Max

    $finish;
          
end

endmodule