module StateDecoder (
	 input wire [3:0] state,
	 input wire [3:0] nextState,
	output reg [5:0] enSig,
	output reg [3:0] aluOp
);
	// en5: R3en
	// en4: R2en
	// en3: R1en
	// en2: OutBuf
	// en1: ImmBuf
	// en0: ExternBuf
	// ADD = 4'b0001
	// OR  = 4'b0010
	// XOR = 4'b0100
	// NOT = 4'b1000

	// opcodes change in state to state transitions
	always @(nextState) begin
		case (nextState)			
			4'd0: aluOp = 4'bXXXX;
			4'd1: aluOp = 4'bXXXX;
			4'd2: aluOp = 4'bXXXX;
			4'd3: aluOp = 4'b0001;
			4'd4: aluOp = 4'b0001;
			4'd5: aluOp = 4'b0010;
			4'd6: aluOp = 4'b0010;
			4'd7: aluOp = 4'b1000;
			4'd8: aluOp = 4'b1000;
			4'd9: aluOp = 4'b0100;
			default: aluOp = 4'bXXXX;
		endcase
	end

	always @(state) begin
		case (state)			
			4'd0: enSig = 6'd0;
			4'd1: enSig = 6'b001001;
			4'd2: enSig = 6'b010010;
			4'd3: enSig = 6'b100000;
			4'd4: enSig = 6'b010100;
			4'd5: enSig = 6'b100000;
			4'd6: enSig = 6'b001100;
			4'd7: enSig = 6'b100000;
			4'd8: enSig = 6'b001100;
			4'd9: enSig = 6'b101000;
			default: enSig = 6'd0;
		endcase
	end
endmodule