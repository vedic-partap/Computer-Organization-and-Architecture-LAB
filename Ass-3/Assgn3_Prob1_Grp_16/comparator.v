
`timescale 1ns / 1ps
module comparator(input [6:0] a, input [6:0] b, output reg out);
	always@(*)
	begin
		if (a > b)
			out=0;
		else
			out=1;
	end
endmodule
	


