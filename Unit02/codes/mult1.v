module Multiplicador(
    input       sel_a,
    input       sel_b,
    input       frac,
    input       signed [16:0] data_a17,
    input       signed [16:0] data_b17,
    output reg  signed [31:0] result_multiplier,
    output reg  flag_overflow
    );
    
reg [31:0] parcial_result;


always @ (*) begin
        parcial_result = data_a17 * data_b17;
        if(frac == 0) begin //truncado de entero
            if( ~|parcial_result[31:16] || &parcial_result[31:16]) begin //1 si no hay diferentes bits , 0 si hay alguna diferencia
                result_multiplier = {{16{parcial_result[31]}},parcial_result[15:0]}; //truncado #falta saturacion, me debo fijar en el bit mas significativo para ver signo y saturar.
                flag_overflow = 1'b0; 
            end else begin
                result_multiplier = {{16{parcial_result[31]}},parcial_result[15:0]}; //truncado #falta saturacion, me debo fijar en el bit mas significativo para ver signo y saturar.
                flag_overflow = 1'b1;
            end
        end else begin //redondeo y truncado de fraccion
            result_multiplier = (parcial_result + 32'h00010000 ) &  32'hFFFF0000;
            flag_overflow = 1'b0;
        end
end
endmodule