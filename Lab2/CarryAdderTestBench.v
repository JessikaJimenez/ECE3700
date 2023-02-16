// Time unit/accuracy
`timescale 1ns/1ns

module CarryAdderTestBench ();
	reg[3:0] x, y;
	wire[3:0] s;
	wire cout;
	
	FourBitCarryAdder addr1(
		.x(x), 
		.y(y),
		.cin(1'b0),
		.s(s), 
		.cout(cout)
	);
	
	integer i, j;
	
	initial begin
		x = 4'b0000;
		y = 4'b0000;
		
		for (i = 0; i < 16; i = i+1) begin
			x = i;
			
			for (j = 0; j < 16; j = j+1) begin
				y = j;
				#10;
				$display("x = %d", x);
				$display("y = %d", y);
				$display("cout = %d", cout);
				$display("sum = %d", s);
			
			end
		
		end

	end
	
endmodule