//MUX 2X1

`timescale 1ns / 1ps
module mux(input select, input [6:0] a, input [6:0] b, output reg [6:0] out);
	always@(*)
	begin
		if (select==0)
			out=a;
		else
			out=b;
	end
endmodule
