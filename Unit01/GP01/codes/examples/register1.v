// Register with a asynchronous active-low reset.

always @ (posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        acc reg <= 16'b0;
    else
        acc reg <= data + acc_reg;
    end

// Register with asynchronous active-high reset.
    // if(rst)
    //     acc_reg <= 16'b0;
    // else 
    //     acc_reg <= data + acc_reg;
end