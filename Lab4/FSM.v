/* 
    The 3 process methodology
    1 process for sequential logic (clock)
    1 process for state transtions
    1 process for state data 
*/

// Finite state machine 
module FSM #(
    parameter START = 3'b001,
    parameter STOP = 3'b010,
    parameter RESET = 3'b100
) (
    input wire goToStart, goToStop, goToReset, output reg[2:0] state
);
// state transition process
always @(negedge goToStart, negedge goToStop, negedge goToReset) begin
    if(!goToStart) begin
        state = START;
    end
    else if(!goToStop) begin
        state = STOP;
    end
    else begin
        state = RESET;
    end
end
    
endmodule
