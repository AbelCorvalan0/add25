module multiplier_17x17_configurable (
    input wire [16:0] a,             // Operando 1 (17 bits).
    input wire [16:0] b,             // Operando 2 (17 bits).
    input wire signed_unsigned_op1,  // 0=unsigned, 1=signed para Op1.
    input wire signed_unsigned_op2,  // 0=unsigned, 1=signed para Op2.
    input wire fractional_integer,   // 0=integer, 1=fractional.
    output reg [31:0] P,             // Producto de 32 bits.
    output reg overflow              // Indicador de overflow (corner case).
);

    // Señales internas
    reg [33:0] product_full;      // Producto completo de 34 bits (17+17)
    
    reg [31:0] trunc_product;
    
    reg [33:0] op1_extended;
    reg [33:0] op2_extended;
    reg [16:0] a_processed;
    reg [16:0] b_processed;
    
    // Procesamiento de operandos según modo signed/unsigned
    always @* begin
        // Procesar Op1
        if (signed_unsigned_op1) begin
            // Modo con signo: extender signo a 34 bits
            a_processed = a;
            op1_extended = {{17{a[16]}}, a};  // Extensión de signo
        end else begin
            // Modo sin signo
            a_processed = a;
            op1_extended = {17'b0, a};        // Extensión con ceros
        end
        
        // Procesar Op2
        if (signed_unsigned_op2) begin
            // Modo con signo: extender signo a 34 bits
            b_processed = b;
            op2_extended = {{17{b[16]}}, b};  // Extensión de signo
        end else begin
            // Modo sin signo
            b_processed = b;
            op2_extended = {17'b0, b};        // Extensión con ceros
        end
        
        // Multiplicación de 17x17 bits
        product_full = op1_extended[16:0] * op2_extended[16:0];
        //
        // Modo fraccionario vs entero
        if (fractional_integer) begin
            // Modo fraccionario: P[30:0],1'b0
            P = {product_full[30:0], 1'b0};
        end else begin
            // Modo entero: P[31:0] directamente
            P = product_full[31:0];
        end
        
        // Check corner case (detección de overflow)
        overflow = 1'b0;
        
        // Para modo entero
        if (!fractional_integer) begin
            if (signed_unsigned_op1 && signed_unsigned_op2) begin
                // Signed x Signed
                // Verificar si el resultado cabe en 32 bits con signo
                if ((product_full[33:31] != 3'b000) && 
                    (product_full[33:31] != 3'b111)) begin
                    overflow = 1'b1;
                end
            end else if (!signed_unsigned_op1 && !signed_unsigned_op2) begin
                // Unsigned x Unsigned
                // Verificar si hay bits en las posiciones 33:32
                if (product_full[33:32] != 2'b00) begin
                    overflow = 1'b1;
                end
            end else begin
                // Mixed signed/unsigned
                // Overflow si el producto no cabe en 32 bits
                if (product_full[33:32] != 2'b00) begin
                    overflow = 1'b1;
                end
            end
        end else begin
            // Modo fraccionario: overflow check diferente
            // Verificar si el desplazamiento causa pérdida de precisión
            if (product_full[33:31] != 3'b000 && 
                product_full[33:31] != 3'b111) begin
                overflow = 1'b1;
            end
        end
    end

endmodule