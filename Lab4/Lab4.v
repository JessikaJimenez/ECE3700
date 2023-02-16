module Lab4(
	input wire start, 
	stop, 
	reset, 
	clk, 
	output [6:0] segments
	);	
	
	wire [3:0] t; //time
	wire [2:0] state;
	wire slowClk;
	// assign clk to a pin (P11 in pin planner)

	// trigger when state changes
	FSM fsm(.goToStart(start), .goToStop(stop), .goToReset(reset), .state(state));  
	
	// trigger when clock ticks
	ClockDivider cd (.fastClk(clk), .slowClk(slowClk));
	
	// change state based on time
	StateDecoder sd (.i_state(state), .i_clk(slowClk), .o_time(t));

	// connect o_time to 7 seg display
	hexTo7Seg sevseg(.bcd(t), .seven_seg(segments));

endmodule