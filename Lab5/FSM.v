module FSM #(
    parameter S0 = 4'd0,
    parameter S1 = 4'd1,
    parameter S2 = 4'd2,
	 parameter S3 = 4'd3,
    parameter S4 = 4'd4,
    parameter S5 = 4'd5,
    parameter S6 = 4'd6,
    parameter S7 = 4'd7,
    parameter S8 = 4'd8,
	 parameter s9 = 4'd9
) (
    input wire clk, reset,
	 output reg [3:0] state,
	 output reg [3:0] nextState
);
	
	always @(state) begin
		case (state)
			S0: nextState = S1;
			S1: nextState = S2;
			S2: nextState = S3;
			S3: nextState = S4;
			S4: nextState = S5;
			S5: nextState = S6;
			S6: nextState = S7;
			S7: nextState = S8;
			S8: nextState = S8;
			default: nextState = S0;
		endcase
	end

	always @(posedge clk, negedge reset) begin
		if(!reset) begin
			state <= S0;
		end
		else begin
			state <= nextState;
		end
	end
    
endmodule
