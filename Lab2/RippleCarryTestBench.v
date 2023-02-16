// Time unit/accuracy
`timescale 1ns/1ns

module RippleCarryTestBench ();
	reg[3:0] x, y;
	wire[3:0] s;
	wire cout;
	
	FourBitAdder addr1(
		.x(x), 
		.y(y), 
		.s(s), 
		.cout(cout)
	);
	
	integer i, j;
	
	initial begin
		x = 4'b0000;
		y = 4'b0000;
		
		for (i = 0; i < 16; i = i+1) begin
			x = i;
			$display("x = %b", x);
			
			for (j = 0; j < 16; j = j+1) begin
				y = j;
				#10;
				$display("y = %b", y);
				$display("cout = %b", cout);
			
			end
		
		end
	
	end
	
endmodule