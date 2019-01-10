`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:26:15 08/20/2018
// Design Name:   combinational_multiplier
// Module Name:   E:/FPGA/Nexys4/comb_multiplier/testmodule.v
// Project Name:  comb_multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: combinational_multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testmodule;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;

	// Outputs
	wire [15:0] product;

	// Instantiate the Unit Under Test (UUT)
	array_multiplier uut (
		.a(a), 
		.b(b), 
		.m(product)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
        $display("%8b, %8b, %8b", a, b, product);
		// Add stimulus here
		a = 8'd5;
		b = 8'd5;
		#100;
		$display("%8b, %8b, %8b", a, b, product);
	end
      
endmodule

