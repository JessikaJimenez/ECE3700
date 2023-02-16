// Lab1 Functional Verilog Multiplexor
module FunctionalMultiplexor (
	input wire[1:0] select, 
	input wire x1, 
	input wire x2, 
	input wire x3, 
	input wire x4, 
	output wire f
	);
	wire notS0, notS1, f00, f01, f10, f11;
	
	assign notS0 = ~select[0];
	assign notS1 = ~select[1];
	assign f00  = ~select[0] & ~select[1] & x1;
	assign f01  = select[0] & ~select[1] & x2;
	assign f10  = ~select[0] & select[1] & x3;
	assign f11  = select[0] & select[1] & x4;
	assign f = f00 | f01 | f10 | f11;
endmodule

// s1, s2 -> select[1:0]