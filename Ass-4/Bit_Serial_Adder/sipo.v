/*Helper Module
				*/
`timescale 1ns / 1ps
module sipo(
    input clk,
	 input load,
    input in,
    output [7:0] out
    );

	reg [7:0] out;
	always @(posedge clk)	//if load=0, right shift, else do nothing
	begin
		if(load == 0)
			out={in,out[7:1]};
	end
	
endmodule 
