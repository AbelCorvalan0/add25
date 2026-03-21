// Model instance of R0, R1, R2, R3 inputs
// i_sw[2:1]
// output 32-bits

// Modeling structure.
// Define of parameters/ vars
// Behaviourial model
// Output connections

module count(

    parameter NB_SW      =  3,
    parameter NB_COUNTER = 32,    
    parameter NB_SW = 3,
    parameter NB_SW = 3,
    parameter NB_SW = 3,
    parameter NB_SW = 3,

)

(
    //Define outputs.
    output         o_valid,

    //Define inputs.
    input [NB_SW - 1 :0]          i_sw   , // Review 1 or 0.
    //input [31:0]  R0, R1, R2, R3, // Inputs?
    input                         i_reset,
    input                           clock 

);

    // Localparameters.
    localparam R0 = ( 2**(NB_COUNTER - 10) ); // LSB
    localparam R1 = ( 2**(NB_COUNTER -  8) );    
    localparam R2 = ( 2**(NB_COUNTER -  6) );
    localparam R3 = ( 2**(NB_COUNTER -  4) );

    // 1/100MHz= 40ns on of LED
    
    // Modeling of mux.
    // Vars.
    wire [NB_COUNTER - 1 : 0]   limit  ;
    reg  [NB_COUNTER - 1 : 0]   counter;
    reg                         valid  ;
    // can be descripted as REG and analize case.
    assign limit = (i_sw[2:1] == 2'b00)? R0:
                   (i_sw[2:1] == 2'b01)? R1:
                   (i_sw[2:1] == 2'b10)? R2: R3;

    // Non-synchronous
    always @(posedge clock) begin//: counterCompare //Label
        if(i_reset) begin
            counter <= {NB_COUNTER{1'b0}}; // Repeat 32 zeros.
            valid   <= 1'b0              ;
        end 
        else if (i_sw[0]) begin
            if(counter >= limit) begin
                counter <= {NB_COUNTER{1'b0}};
                valid   <= 1'b1              ;
            end
            else begin
                counter <= counter + {NB_COUNTER-1{1'b0}};
                valid   <= 1'b0;
            end
        end
    end
    else begin
        counter <= counter;
        valid   <= valid  ;
    end

    assign o_valid = valid;

endmodule