module ALU #(
	parameter ADD = 4'b0001,
	parameter XOR = 4'b0010,
	parameter NOT = 4'b0100,
	parameter OR  = 4'b1000

) (
	input wire [3:0] A, B, op,
	output reg [3:0] result
);

	always @(A, B, op) begin
		case (op)  
			ADD: result = A + B;
			OR:  result = A | B;	
			XOR: result = A ^ B;
			NOT: result = ~A;
			default: result = A;
		endcase
	end

endmodule