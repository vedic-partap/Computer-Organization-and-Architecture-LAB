`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:37:22 11/05/2018
// Design Name:   My_Processor
// Module Name:   /home/vernwalrahul/5th Sem/CoA/S_C_CPU/My_Processor_tb.v
// Project Name:  S_C_CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: My_Processor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module My_Processor_tb;

	// Inputs
	reg clk;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	My_Processor uut (
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		#10;
		clk = 0;
		reset = 1;
		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
        
		// Add stimulus here

	end
	always 
	begin
	   #10;
		clk = ~clk;

	end
      
endmodule

