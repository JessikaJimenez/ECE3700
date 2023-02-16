// Purpose of latch is to save a previous stage:
// Anytime clock is high, output = data.
// Anytime clock is low, don't care about data.
// D: data, Q: output
// Refer to Gated D Latch model CH 5.3, Figure 5.7, pg 255

module MyLatch (
	input wire D, 
	trigger, 
	output reg Q
	);

	// trigger = clock
	reg _Q;

	always @ (trigger, D) begin
		_Q = Q;
	
		if (trigger == 1'b1) Q = D;
		else Q = _Q;
	end

endmodule