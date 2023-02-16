`timescale 1ns/1ns

module Lab4TestBench();
	
	reg start, stop, reset, clk;
   wire [6:0] sevSeg;
   integer countToStop = 0;

	// connect the start, stop, reset, and sevSeg values
   Lab4 l4(.start(start), .stop(stop), .reset(reset), .clk(clk), .segments(sevSeg));

   initial begin
		clk = 1'b0;
		start = 1'b1;
		stop = 1'b1;
		reset = 1'b1;
		#10
		// trigger a reset
		reset = 1'b0;
		#10
		// trigger a start
		start = 1'b0;
		// return reset to its default value. 
		reset = 1'b1;
		#10
		// return start to its default value
		start = 1'b1;
	end

	always #20 begin
	  // This simulates our 50Mhz clock.
	  clk = !clk;
	  // After 500 time intervals, trigger a stop
	  // you can set this to any value you like
	  if(countToStop == 500) begin
			stop = 1'b0;
			#10
			stop = 1'b1;
	  end
	  // After 100 more time intervals, start again
	  else if(countToStop == 600) begin
			start = 1'b0;
			#10
			start = 1'b1;
	  end
	   // because this is a simulation file, we don't need an else block here
		countToStop = countToStop + 1;
	 end

endmodule 