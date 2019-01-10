/*Full Adder
				*/
`timescale 1ns / 1ps
module Adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
    );

	assign {cout, sum} = a+b+cin;	//Adding the operands and storing in sum and cout

endmodule 
