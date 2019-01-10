/*Helper Module
				*/
`timescale 1ns / 1ps
module ShiftReg(
    input clk,
    input rst,
    input load,
    input [7:0] in,
    output [7:0] out
    );


	reg [7:0] out;

	always @(posedge clk)	//if reset=1, assign out=0, else if load=1, assign out=input given, else right shift
	begin
		if (load == 0 & rst == 0)
			out=out>>1;
		else if (load ==1 & rst == 0)
			out=in;
		else
			out=8'b0;
	end
	
endmodule



