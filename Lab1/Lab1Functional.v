// Lab1 thing for Functional verilog
module Lab1Functional(
	input wire[1:0] select, 
	input wire[1:0] a, 
	input wire[1:0] b, 
	output wire[1:0] f
	);
	wire [4:0] logic1, logic2;	
	// Does lab logic and outputs on logic1
	FunctionalLabLogic ll1(
		.a(a[0]),
		.b(b[0]),
		.f(logic1)
	);
	// Does lab logic and outputs on logic2
	FunctionalLabLogic ll2(
		.a(a[1]),
		.b(b[1]),
		.f(logic2)
	);	
	// Selects for f[0]
	FunctionalMultiplexor mux1(
		.select(select),
		.x1(logic1[0]),
		.x2(logic1[1]),
		.x3(logic1[2]),
		.x4(logic1[3]),
		.f(f[0])
	);
	// Selects for f[1]
	FunctionalMultiplexor mux2(
		.select(select),
		.x1(logic2[0]),
		.x2(logic2[1]),
		.x3(logic2[2]),
		.x4(logic2[3]),
		.f(f[1])
	);	
endmodule