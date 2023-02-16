// Time unit/accuracy
`timescale 1ns/1ns

module Lab1_Structural_Testbench;
	reg[1:0] a, b, select;
	wire[1:0] f;
	
	Lab1Structural lab1(
		.a(a), 
		.b(b), 
		.select(select), 
		.f(f)
	);
	
	integer i, j, k;
	
	initial begin
		a = 2'b00;
		b = 2'b00;
		select = 2'b00;
		
		for (i = 0; i < 8; i = i+1) begin
			a = i;
			$display("a = %b", a);
			
			for (j = 0; j < 8; j = j+1) begin
				b = j;
				$display("b = %b", b);
			
				for (k = 0; k < 8; k = k+1) begin
					select = k;
					$display("a = %b", a);
					$display("select = %b", select);
					$display("f = %b", f);
				
				end
			
			end
		
		end
	
	end
	
endmodule