`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// GROUP 16 
// Vedic Partap 16CS10053 - Team Leader
// Rahul Kumar 16CS10042 - Remote Intern
// Restoring Unsigned Integer Divider
//////////////////////////////////////////////////////////////////////////////////
module Divide(
    input [7:0] A,  // Dividend
    input [7:0] B, // Divisor
	 input clk,    // clock 
	 input reset, // Reset Flag
	 output reg done,
    output wire [7:0] Res, // Result aka Remainder
	 output reg [7:0] Q    // Quotient
    );
	
	reg [15:0] divisor_copy; // Copy
	reg [15:0] rem; 
	
	integer i; // counter 

	assign Res = rem[7:0];
	// always block to compute th result for positive edge clock
	always @(posedge clk or posedge reset) begin
		// Initialise the value 
		if(reset) begin
			divisor_copy = {B[7:0], 8'b0};
			rem = {8'b0, A[7:0]};
			done = 0;
			Q = 8'b0;
			i = 0;
		end
		else begin
			if(done==0) begin
				rem = rem - divisor_copy;	
				if(rem[15]==0) begin
					Q = Q<<1;
					Q[0] = 1;
				end
				else begin 
					Q = Q<<1; 
					Q[0] = 0;
					rem = rem + divisor_copy;
				end
				divisor_copy = divisor_copy>>1;
				i = i+1;   // increment the counter
				if(i==9)
					done = 1;
			end
		end
	end
endmodule
