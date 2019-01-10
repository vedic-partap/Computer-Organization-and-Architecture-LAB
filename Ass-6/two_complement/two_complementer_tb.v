`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:14:47 09/02/2018
// Design Name:   two_complementer
// Module Name:   /home/vernwalrahul/CoA/Projects/Two_Complement/two_complementer_tb.v
// Project Name:  Two_Complement
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: two_complementer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module two_complementer_tb;

	// Inputs
	reg inp;
	reg clk;
	reg reset;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	two_complementer uut (
		.inp(inp), 
		.clk(clk), 
		.reset(reset), 
		.out(out)
	);
	// Initialize Inputs
	reg [15:0]sequence;
	reg [15:0]output_seq;
	integer i;
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		inp = 0;
		assign sequence =  16'b0101011101110010;
		i=0;
		// Wait 100 ns for global reset to finish
		#5;
		reset =0;
		for( i = 0; i <= 15; i = i + 1)
		begin
			inp = sequence[i];
			clk = 1;
			#2;
			clk = 0;
			#2;
			output_seq[i] = out;
			$display(" Input = ", inp, ", Output = ", out);
		end

	end
      
endmodule

