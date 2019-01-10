`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Name     :Vedic Partap
// Roll No. :16CS10053
// Subject  :COA LAB TEST -1 
// File     :Sign-magnitude Binary Multiplier 
// Type     :Test Bench 
////////////////////////////////////////////////////////////////////////////////

module tb_multiplier;

	// Inputs
	reg [5:0] a;
	reg [5:0] b;
	reg clk;
	reg start;

	// Outputs
	wire [11:0] product;
	wire done;
	// Instantiate the Unit Under Test (UUT)
	multiplier uut (
		.a(a), 
		.b(b), 
		.clk(clk), 
		.start(start), 
		.product(product),
		.done(done)
	);

	initial begin
		// Initialize Inputs
		a = 14;
		b = 32;
		clk = 0;
		start = 0;

		// Wait 100 ns for global reset to finish
		#50;
      start = 1;
		#50;
		// Add stimulus here

	end
      
	always begin
		#20 clk = !clk;
	end
endmodule

