module FourBitCarryAdder (
	input wire [3:0] x, 
	input wire [3:0] y, 
	input wire cin, 
	output wire [3:0] s, 
	output wire cout);
	
	// For fast four bit lookahead carry adder 
	// Note: bits'<basse><value> .. ex: 1'b0 = 0, ex: 3'd4 = 100
	
	wire c_1, c_2, c_3, c_4;
	wire gout1, gout2, gout3;
	wire pout1, pout2, pout3;
	wire cout1, cout2, cout3;
	
	CarryAdder adder1(.ci_1(1'b0), .x(x[0]), .y(y[0]), .cin(1'b0),  .gin(1'b0),  .pin(1'b0),  .gout(gout1), .pout(pout1), .cout(cout1), .s(s[0]), .ci_1out(c_1));   
			
	CarryAdder adder2(.ci_1(c_1),  .x(x[1]), .y(y[1]), .cin(cout1), .gin(gout1), .pin(pout1), .gout(gout2), .pout(pout2), .cout(cout2), .s(s[1]), .ci_1out(c_2));  
			
	CarryAdder adder3(.ci_1(c_2),  .x(x[2]), .y(y[2]), .cin(cout2), .gin(gout2), .pin(pout2), .gout(gout3), .pout(pout3), .cout(cout3), .s(s[2]), .ci_1out(c_3));  
			
	CarryAdder adder4(.ci_1(c_3),  .x(x[3]), .y(y[3]), .cin(cout3), .gin(gout3), .pin(pout3), .gout(gout),  .pout(pout),  .cout(cout),  .s(s[3]), .ci_1out(c_4));  

endmodule