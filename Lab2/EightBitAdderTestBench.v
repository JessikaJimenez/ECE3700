`timescale 1ns/1ns

module EightBitAdderTestBench ();
	reg[7:0] x, y;
	wire[7:0] s;
	wire cout;
	
	EightBitAdder addr1(
		.x(x), 
		.y(y), 
		.s(s), 
		.cout(cout)
	);
		
	initial begin
		x = 8'd0;
		y = 8'd0;
		
		// should cause carry out
		x = 16;
		y = 16;
		#10;
		
		$display("x = %d", x);
		$display("y = %d", y);
		$display("cout = %d", cout);
		$display("sum = %d", s);

		
		// should cause an overflow
		x = 31;
		y = 31;
		#10;
		
		$display("x = %d", x);
		$display("y = %d", y);
		$display("cout = %d", cout);
		$display("sum = %d", s);

		
		// should be a-okay
		x = 3;
		y = 2;
		#10;
		
		$display("x = %d", x);
		$display("y = %d", y);
		$display("cout = %d", cout);
		$display("sum = %d", s);

	
	end
	
endmodule