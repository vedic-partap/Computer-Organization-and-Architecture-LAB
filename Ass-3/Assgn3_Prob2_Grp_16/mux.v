
`timescale 1ns / 1ps
module mux(input select, input [7:0] a, input [7:0] b, output reg [7:0] out);
	always@(*)
	begin
		if (select==0)
			out=a;
		else
			out=b;
	end
endmodule
