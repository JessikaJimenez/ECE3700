// Lab1 Structural Verilog Multiplexor
module StructuralMultiplexer (
	input wire[1:0] select, 
	input wire x1, 
	input wire x2, 
	input wire x3, 
	input wire x4, 
	output wire f
	);
	wire notS0, notS1, f00, f01, f10, f11;
	
	not (notS0, select[0]);
	not (notS1, select[1]);
	and (f00, notS0, notS1, x1);
	and (f01, notS1, select[0], x2);
	and (f10, notS0, select[1], x3);
	and (f11, select[0], select[1], x4);	
	or (f, f00, f01, f10, f11);
endmodule

// s1, s2 -> select[1:0]