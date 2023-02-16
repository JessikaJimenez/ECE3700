module Buffer (
	input wire [3:0] in,
	inout wire [3:0] out,
	input wire en
);
	// if en is true-- then in; else 4'bZZZZ
	assign out = en ? in : 4'bZZZZ; 

endmodule