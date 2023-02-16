module FourBitAdder(
	input wire [3:0] x, 
	input wire [3:0] y, 
	output wire [3:0] s, 
	output wire cout);
	
	wire cout1, cout2, cout3;
	Adder adder1(.x(x[0]), .y(y[0]), .cin(1'b0),  .cout(cout1), .s(s[0]));   
	Adder adder2(.x(x[1]), .y(y[1]), .cin(cout1), .cout(cout2), .s(s[1]));  
	Adder adder3(.x(x[2]), .y(y[2]), .cin(cout2), .cout(cout3), .s(s[2]));  
	Adder adder4(.x(x[3]), .y(y[3]), .cin(cout3), .cout(cout),  .s(s[3]));  

endmodule