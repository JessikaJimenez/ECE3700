module Adder (
	input wire x, 
	input wire y, 
	input wire cin, 
	output wire s, 
	output wire cout);
	
	// si = xi xor yi xor ci
	assign s = x^y^cin;
	
	// ci+1 = xi*yi + xi*ci + yi*ci
	assign cout = (x & y) | (x & cin) | (y & cin);

endmodule