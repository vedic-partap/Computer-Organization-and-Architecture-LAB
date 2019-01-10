`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:42:37 10/09/2018 
// Design Name: 
// Module Name:    PCounter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ProgramCounter(clk, reset,branch, pc_branch_target,pc_4, pc);
	parameter	size=32;
	input		clk,branch;
	input		reset;
	input    [size-1:0] pc_branch_target;
	input    [size-1:0] pc_4;
	output	[size-1:0]	pc;

	//	The outputs are defined as registers too
	reg	[size-1:0]	pc;
	


	always @(posedge clk)
	begin
		if (reset)
			pc = 0;
		else
		begin
			if (branch)
				pc = pc_branch_target;
			else
				pc = pc_4;
		end
	end

endmodule
