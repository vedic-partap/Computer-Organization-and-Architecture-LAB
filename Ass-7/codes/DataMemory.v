`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:38:59 10/09/2018 
// Design Name: 
// Module Name:    DMem 
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
module DataMemory(clk,reset,address,mem_write,mem_read,write_data,read_data);

   parameter size=32, MemSize=32;
	input	clk;
	input	reset;
	input	[size-1:0]	address;
	input mem_write, mem_read;
	input [size-1:0]	write_data;
	output  [size-1:0]	read_data;
	
	reg	[size-1:0]	DMem[0:MemSize];


	assign read_data = DMem[address];

	always @(posedge clk ) 
	begin
		if(reset)
		begin
			DMem[0] = 5;
			DMem[1] = 6;
			DMem[2] = 10;
			DMem[3] = 1;
			DMem[4] = 5;
			DMem[5] = 4;
		end
		if (mem_write)	
			DMem[address] = write_data;
	end	
endmodule
