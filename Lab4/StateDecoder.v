// **TODO - fixme

module StateDecoder (
	input wire [2:0] state, 
	input wire i_clk, 
	output reg [3:0] o_time
);
    wire _clk;
    reg reset;
    reg latch;
    MyLatch dlatch(.D(i_clk), .trigger(latch), .Q(_clk)); 
	 
    // sequential process
    always @(posedge _clk, posedge reset) begin
        if(reset) begin
            o_time <= 0;
        end
        else if(o_time < 4'd9) begin 
            o_time <= o_time+1;
        end
        else begin
            o_time <= 0; // loop back
        end
    end
    // state data process
    always @(state) begin
        if(state == 3'b100) begin
				// FSM.RESET
            reset = 1'b1;
				latch = 1'b0;
        end
        else if(state == 3'b010) begin
				// FSM.STOP
            reset = 1'b0;
            latch = 1'b0;
        end
        else begin
				// FSM.START == 3'b001
            reset = 1'b0;
            latch = 1'b1;
        end
    end
endmodule