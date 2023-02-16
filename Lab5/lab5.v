module lab5 (
	input wire [3:0] external,
	input wire clk, reset,
	output wire [6:0] sevseg
);
	wire [3:0] state, nextState;
	wire [5:0] enSig; 
	wire [3:0] R1out, R2out, R3out, aluOp, databus;
	
	FSM fsm 				  (.clk(clk),     .reset(reset),    .state(state),  .nextState(nextState));
	StateDecoder sd     (.state(state), .enSig(enSig), 	.aluOp(aluOp),  .nextState(nextState));
	ALU alu 				  (.A(R1out), 	   .B(R2out), 	      .op(aluOp),     .result(R3));
	Registers registers (.R1(dataBus),  .R2(dataBus),     .R3(R3),        .en(enSig[5:3]), 
								.reset(reset), .R1out(R1out),    .R2out(R2out),  .R3out(R3out));
	Buffer externBuf    (.in(external), .en(enSig[0]),    .out(dataBus));
	Buffer immBuf   	  (.in(4'b0011),  .en(enSig[1]),    .out(dataBus));
	Buffer outBuf 	     (.in(R3out),    .en(enSig[2]),    .out(databus));
	Sevenseg sevenseg   (.hex_input(dataBus), .seven_seg(sevseg));

endmodule