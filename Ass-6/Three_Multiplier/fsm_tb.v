`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:22:05 08/29/2018
// Design Name:   fsm
// Module Name:   /home/vernwalrahul/CoA/Projects/FSM/fsm_tb.v
// Project Name:  FSM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fsm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fsm_tb;

	// Inputs
	reg a;
	reg clk;
	reg reset;

	// Outputs
	wire b;

	// Instantiate the Unit Under Test (UUT)
	fsm uut (
		.a(a), 
		.clk(clk), 
		.reset(reset), 
		.b(b)
	);
	reg [9:0]inp;
	reg [9:0] inp1;
	reg [9:0] out_seq;
	reg [9:0] out1_seq;
	integer i;
	initial begin
		// Initialize Inputs
		inp[9:0] = 10'b1010101101;
		inp1[9:0] = 10'b100101010;
		i = 0;
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#99;
      reset = 0;
		for(i=0;i<10;i=i+1) begin
			a = inp[i];
			#40;
			out_seq[i] = b;
		end
		
		reset = 1;
		#119;
		reset = 0;
		for(i=0;i<10;i=i+1) begin
			a = inp1[i];
			#10;
			out1_seq[i] = b;
			#30;
		end
	end
	
	always begin
		#20 clk = !clk;
	end
      
endmodule

