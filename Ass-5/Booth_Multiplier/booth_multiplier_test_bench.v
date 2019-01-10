`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:59:41 08/26/2018
// Design Name:   booth_multiplier
// Module Name:   /home/vernwalrahul/CoA/Projects/Booth_Multiplier/booth_multiplier_test_bench.v
// Project Name:  Booth_Multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: booth_multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module booth_multiplier_test_bench;

	// Inputs
	reg [5:0] X;
	reg [5:0] Y;
	reg clk;
	reg load;

	// Outputs
	wire [11:0] Z;

	// Instantiate the Unit Under Test (UUT)
	booth_multiplier uut (
		.X(X), 
		.Y(Y), 
		.clk(clk), 
		.load(load), 
		.Z(Z)
	);

	initial begin
		// Initialize Inputs
		X = 4;
		Y = -2;
		clk = 0;
		load = 0;

		// Wait 100 ns for global reset to finish
		#50;
      load = 1;
		#50;
		// Add stimulus here

	end
      
	always begin
		#20 clk = !clk;
	end
endmodule

