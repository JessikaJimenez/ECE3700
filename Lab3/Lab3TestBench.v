`timescale 1ns/1ns

module Lab3TestBench ();
	reg[3:0] A, B;
	reg c;
	wire [3:0] F;
	
	Lab3 lab3test(
		.A(A), 
		.B(B), 
		.c(c), 
		.F(F)
	);

	// Test every case
	// F = {F1, F2, F3}
	// A > B,  F1 = 1, F2 = F3 = 0 -> F = {1, 0, 0}
	// A == B, F2 = 1, F1 = F3 = 0 -> F = {0, 1, 0}
	// A < B,  F3 = 1, F2 = F1 = 0 -> F = {0, 0, 1}
	
			
	initial begin
		A = 4'd0;
		B = 4'd0;
		c = 1'b0;
		
		// Case: c == 1 -> A == B
		c = 1'b1;
		A = 1;
		B = 1;
		#10;
		$display("A = %d", A);
		$display("B = %d", B);
		$display("F = %b", F);  // F = 010
		$display("\n");		
				
		// Case: c == 1 -> A neg, B pos: A < B
		c = 1'b1;
		A = -1;
		B = 1;
		#10;
		$display("A = %d", A);
		$display("B = %d", B);
		$display("F = %b", F);  // F = 001
		$display("\n");	
						
		// Case: c == 1 -> A pos, B neg: A > B
		c = 1'b1;
		A = 1;
		B = -1;
		#10;
		$display("A = %d", A);
		$display("B = %d", B);
		$display("F = %b", F);  // F = 100
		$display("\n");	
								
		// Case: c == 1 -> A neg, B neg, sign bit neg so A < B
		c = 1'b1;
		A = -2;
		B = -1;
		#10;
		$display("A = %d", A);
		$display("B = %d", B);
		$display("F = %b", F);  // F = 001
		$display("\n");	
		
		// Case: c == 1 -> A neg, B neg, sign bit pos so A > B
		c = 1'b1;
		A = -1;
		B = -2;
		#10;
		$display("A = %d", A);
		$display("B = %d", B);
		$display("F = %b", F);  // F = 100
		$display("\n");	
	
		// Case: c == 1 -> A pos, B pos, sign bit neg so A < B
		c = 1'b1;
		A = 1;
		B = 2;
		#10;
		$display("A = %d", A);
		$display("B = %d", B);
		$display("F = %b", F);  // F = 001
		$display("\n");	
		
		// Case: c == 1 -> A pos, B pos, sign bit pos so A > B
		c = 1'b1;
		A = 2;
		B = 1;
		#10;
		$display("A = %d", A);
		$display("B = %d", B);
		$display("F = %b", F);  // F = 100
		$display("\n");	
		
		
		
		
		// Case: c == 0 -> A > B
		c = 1'b0;
		A = 2;
		B = 1;
		#10;
		$display("A = %d", A);
		$display("B = %d", B);
		$display("F = %b", F);  // F = 100
		$display("\n");	
		
		// Case: c == 0 -> A < B
		c = 1'b0;
		A = 1;
		B = 2;
		#10;
		$display("A = %d", A);
		$display("B = %d", B);
		$display("F = %b", F);  // F = 001
		$display("\n");	
		
		// Case: c == 0 -> A == B
		c = 1'b0;
		A = 1;
		B = 1;
		#10;
		$display("A = %d", A);
		$display("B = %d", B);
		$display("F = %b", F);  // F = 010
		$display("\n");	
		
	end		

endmodule