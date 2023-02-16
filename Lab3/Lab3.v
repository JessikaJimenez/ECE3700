module Lab3 (
	input wire[3:0] A, B,
	input wire c,
	output reg[3:0] F
	);
	
	reg[3:0] aMinb;
	
	always @(aMinb, A, B, c) begin	
	
		aMinb = A - B;
	
		if (c == 1'b1) begin
			// 2's complement signed
			
			// F = {F1, F2, F3}
			// A > B,  F1 = 1, F2 = F3 = 0 -> F = {1, 0, 0}
			// A == B, F2 = 1, F1 = F3 = 0 -> F = {0, 1, 0}
			// A < B,  F3 = 1, F2 = F1 = 0 -> F = {0, 0, 1}
						
			
			// CASES for aMinb:
			
			if (aMinb == 4'b0000) begin
				// A == B
				F = 3'b010;  //F = {0, 1, 0};  

			end
			if (A[3] == 1 && B[3] == 0) begin
				// A is neg
				// B is pos
				// A is always < B, so check sign bits
				F = 3'b001;  //F = {0, 0, 1};  
			
			end
			else if (A[3] == 0 && B[3] == 1) begin
				// A is pos
				// B is neg
				// A always > B, so check sign bits
				F = 3'b100;   //F = {1, 0, 0};
			
			end
			else if (A[3] == B[3] && A[3] == 1) begin
				// A is neg
				// B is neg
				// check sign bit of A - B -> if sign bit neg then A < B, else if sign bit pos then A > B 
			
				if (aMinb[3] == 1) begin
					// sign bit neg, so A < B
					F = 3'b001;  //F = {0, 0, 1};  
					
				end
				else begin
					// sign bit pos, so A > B 
					F = 3'b100;  //F = {1, 0, 0};
				
				end	
			end
			else begin
				// A is pos
				// B is pos
				// check if all bits the same
				if (A[3] == B[3] && A[2] == B[2] && A[1] == B[1] && A[0] == B[0]) begin
					// A == B
					F = 3'b010;  //F = {0, 1, 0};  

				end
				// check sign bit of A - B -> if sign bit neg then A < B, else if sign bit pos then A > B 
			
				else if (aMinb[3] == 1) begin
					// sign bit neg, so A < B
					F = 3'b001;  //F = {0, 0, 1};  
					
				end
				else if (aMinb[3] == 0)begin
					// sign bit pos, so A > B 
					F = 3'b100;  //F = {1, 0, 0};
				
				end
			
			end
			
		end	
		
		// if (c == 0)
		else begin
		// 2's complement unsigned
			if (A > B) begin
				F = 3'b100;  //F = {1, 0, 0};

			end
			else if (A < B) begin
				F = 3'b001;  //F = {0, 0, 1};  

			end
			else begin
				// A == B
				F = 3'b010;  //F = {0, 1, 0};  

			end
		
		end
		
	end

endmodule