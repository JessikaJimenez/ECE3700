// Lab1 Structural LabLogic
module StructuralLabLogic (
	input wire a, 
	input wire b, 
	output wire[3:0] f
	);
	wire i0, i1, i2, i3;
	
	and(i0, a, b);
	or(i1, a, b);
	xor(i2, a, b);
	not(i3, a);
	assign f = {i3, i2, i1, i0};
endmodule