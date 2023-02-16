// Lab1 Functinal LabLogic
module FunctionalLabLogic (
	input wire a, 
	input wire b, 
	output wire[3:0] f
	);
	wire i0, i1, i2, i3;
	
	assign i0 = a&b;
	assign i1 = a^b;
	assign i2 = a~^b;
	assign i3 = ~a;
	assign f = {i3, i2, i1, i0};
endmodule