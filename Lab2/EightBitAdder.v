module EightBitAdder (
	input wire [7:0] x, 
	input wire [7:0] y, 
	output wire [7:0] s, 
	output wire cout);

	wire cout_1;
	
	FourBitCarryAdder adder1 (.x(x[7:4]), .y(y[7:4]), .cin(1'b0), .s(s[7:4]), .cout(cout_1));
	FourBitCarryAdder adder2 (.x(x[3:0]), .y(y[3:0]), .cin(1'b0), .s(s[3:0]), .cout(cout));

endmodule