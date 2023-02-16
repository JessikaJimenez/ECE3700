module CarryAdder (
	input wire ci_1,
	input wire x, 
	input wire y, 
	input wire cin, 
	input wire gin, 
	input wire pin, 
	output wire gout, 
	output wire pout, 
	output wire cout,
	output wire s,
	output wire ci_1out
	);
	// For fast adder aka lookahead carry adder

	// Pi = Xi + Yi
	assign p = x | y;
	// Gi = Xi*Yi
	assign g = x & y;

	// ci+1 = Gi + Pi*Gi-1 + Pi*Pi-1*Ci-1
	assign c = g | (p & gin) | (p & pin & ci_1);
	
	assign gout = g;
	assign pout = p;	
	assign cout = c;
	
	// Si = Pi xor Ci --> x xor y xor cin
	assign s = x ^ y ^ cin;
	
	assign ci_1out = cin;
	
endmodule