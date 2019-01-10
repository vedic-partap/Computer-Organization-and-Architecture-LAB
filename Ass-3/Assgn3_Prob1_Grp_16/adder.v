
`timescale 1ns / 1ps
module adder(input [6:0] a, input [6:0] b, input cin, output [6:0] sum, output cout);
	assign {cout, sum} = a + b + cin;
endmodule
