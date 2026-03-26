module shifreg
(
    parameter NB_LEDS = 4
)

(

    // Define outputs.
    output [3:0] o_led  ,

    input        i_valid,
    input        i_reset,
    input        clock  
);

    // Variables
    reg [NB_LEDS - 1 : 0] shiftreg;

    always @(posedge clock) begin
        if(i_reset) begin
            shiftreg <= 4'b0001; //{{NB_LEDS-1{1'b0}}, 1'b1} // 1; 
        end
        else if(i_valid) begin
            // option 1
            shiftreg    <= shiftreg << 1;
            shiftreg[0] <= shifreg[NB_LEDS-1];

            // option 2
            shifreg  <= {shifreg[NB_LEDS - 2 -: NB_LEDS - 1], shifreg[NB_LEDS - 1]}
        end
    end

endmodule