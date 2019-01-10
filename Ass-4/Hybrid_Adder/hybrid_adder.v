/*Hybrid Adder
				*/
`timescale 1ns / 1ps
`include "carry_lookahead_adder.v"
module hybrid_adder(
    input [7:0] a,
    input [7:0] b,
    input cy_in,
    output [7:0] sum,
    output cy_out
    );

	wire cout;	

	//CLA module called 2 times
	carry_lookahead_adder INST1(a[3:0],b[3:0],cy_in,sum[3:0],cout);
	carry_lookahead_adder INST2(a[7:4],b[7:4],cout,sum[7:4],cy_out);
	
endmodule
