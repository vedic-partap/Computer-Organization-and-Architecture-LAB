/*Helper Module
				*/
`timescale 1ns / 1ps
module adder(input a, input b, input cin, output sum, output cout);
	assign {cout,sum} = a+b+cin;	//Adding a,b and cin and stored in sum and the overflow in cout
endmodule
