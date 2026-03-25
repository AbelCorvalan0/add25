module SatTruncFP
// It's a fixed-point format conversion block.
// It takes:
// 	- A wide fixed-point number (i_data).
//  - And converts it to a narrower fixed-point number (o_data).

// While correctly handling:
// 		- fractional truncation.
// 		- sign extension.
//      - saturation (overflow protection).
  #(
	// Total input bits.
    parameter	NB_XI  	= 20,
	// Input fractional bits.
    parameter	NBF_XI	= 12,
	// Format S(NB_XI, NBF_XI).
    
	// Total output bits.
    parameter	NB_XO	= 8,
	// Output fractional bits.
    parameter	NBF_XO	= 6
    )
   (

	// Input and output 20 bits [19:0].
    input [(NB_XI)-1:0]  i_data,
    output [(NB_XO)-1:0] o_data
    );


//=======================================================
//  PARAMETER declarations
//=======================================================
   // Total bits - Fractional bits. Integer number of bits.
   localparam	NBI_XI	=	NB_XI	-	NBF_XI;
   localparam	NBI_XO	=	NB_XO	-	NBF_XO;
   
//=======================================================
//  REG/WIRE declarations
//=======================================================
   // Final saturated result.
   // Size NB_X0 total number of output bits.
   wire [NB_XO-1:0] 	 aux_Sat;
   
   // Fractional part after truncation or scaling.
   // Size NB_X0 number of fractional bits.
   wire [NBF_XO-1:0] 	 aux_trunc;
   
   // Overflow detection flag.
   wire 		 condicion;
   // Saturation value (max or min).
   wire [NB_XO-1:0] 	 resultado1;
   // Normal truncated value.
   wire [NB_XO-1:0] 	 resultado2;

//=======================================================
//  Structural coding
//=======================================================
	generate
	   if (NBF_XI >= NBF_XO)
	   // If number of fractional number of input bits are more than (or equal to) number of fractional output bits
	     begin
	    // Fractional part after truncation or scaling.
		// Size fractional bit number of input, fractional bit number of input - fractional bit number of output.
		// [12 - 1, 12 - 6]= [11, 6]
		assign	aux_trunc = i_data[(NBF_XI-1):(NBF_XI - NBF_XO)];
	     end
	   else
	     begin
		// Take the fractional bits of the input.
		// Append zeros at the LSB side.
		
		// Appending zeros at the LSB is equivalent to:
		// value.2^(NBF_X0 - NBF_XI)
		// This is a left shift, not truncation.

		// { i_data[NBF_XI-1:0], zeros }
		// (NBF_XO - NBF_XI){1'b0}
		// (NBF_XO - NBF_XI) zeros.
		// Add 2 zeros.
		assign	aux_trunc = {i_data[NBF_XI-1:0],{(NBF_XO - NBF_XI){1'b0}}};
	     end
	   if (NBI_XI > NBI_XO)
	     begin
		// 
		assign	condicion		=	(i_data[(NB_XI-2)-:(NBI_XI-NBI_XO)] == {(NBI_XI-NBI_XO){i_data[NB_XI-1]}});
		assign	resultado1		=	{i_data[(NB_XI-1)],{(NB_XO-1){~i_data[(NB_XI-1)]}}};
		assign	resultado2		=	{i_data[(NB_XI-1)],i_data[NBF_XI +:NBI_XO-1],aux_trunc};
		assign	aux_Sat			=	condicion	?	resultado2	:	resultado1;
	     end
	   else
	     begin
		if (NBI_XO == NBI_XI)
                  assign  aux_Sat = {i_data[(NB_XI-1)-:NBI_XI],aux_trunc};
		else
		  assign  aux_Sat	= {{(NBI_XO - NBI_XI){i_data[NB_XI-1]}},i_data[(NB_XI-1)-:NBI_XI],aux_trunc};
	     end
	endgenerate
   assign	o_data=aux_Sat;
      
endmodule
