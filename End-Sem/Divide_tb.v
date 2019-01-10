`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// GROUP 16 
// Vedic Partap 16CS10053 - Team Leader
// Rahul Kumar 16CS10042 - Remote Intern
// Test Bench : Restoring Unsigned Integer Divider 
//////////////////////////////////////////////////////////////////////////////////

module Divide_tb;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg clk;
	wire done;
	reg reset;
	// Outputs
	wire [7:0] Rem;
	wire [7:0] Q;

	// Instantiate the Unit Under Test (UUT)
	Divide uut (
		.A(A), 
		.B(B), 
		.clk(clk), 
		.reset(reset),
		.done(done),
		.Res(Rem), 
		.Q(Q)
	);

	initial begin
		// Initialize Inputs
		A = 102;
		B = 4;
		clk = 0;
		reset = 0;
		reset = 1;
		// Wait 100 ns for global reset to finish
		#20;
      reset = 0;
	
		// Add stimulus here

	end
      
	always begin
		
			#20 clk = ~clk;
	end
endmodule

