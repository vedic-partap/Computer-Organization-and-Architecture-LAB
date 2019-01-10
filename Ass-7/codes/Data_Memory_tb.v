`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:46:48 11/05/2018
// Design Name:   DataMemory
// Module Name:   /home/vernwalrahul/5th Sem/CoA/S_C_CPU_Group_16/Data_Memory_tb.v
// Project Name:  S_C_CPU_Group_16
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Data_Memory_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] address;
	reg mem_write;
	reg mem_read;
	reg [31:0] write_data;

	// Outputs
	wire [31:0] read_data;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.clk(clk), 
		.reset(reset), 
		.address(address), 
		.mem_write(mem_write), 
		.mem_read(mem_read), 
		.write_data(write_data), 
		.read_data(read_data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		address = 0;
		mem_write = 0;
		mem_read = 0;
		write_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

