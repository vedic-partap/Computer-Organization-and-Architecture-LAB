/*Rahul Kumar
  Vedic Partap
				*/
`timescale 1ns / 1ps
`include "adder.v"
module ripple_carry_adder(
    input [7:0] a,
    input [7:0] b,
    input cy_in,
    output [7:0] sum,
    output cy_out
    );

	wire [6:0] cout;	//To connect modules of the adder

	adder INST0(a[0],b[0],cy_in,sum[0],cout[0]);
	adder INST1(a[1],b[1],cout[0],sum[1],cout[1]);
	adder INST2(a[2],b[2],cout[1],sum[2],cout[2]);
	adder INST3(a[3],b[3],cout[2],sum[3],cout[3]);
	adder INST4(a[4],b[4],cout[3],sum[4],cout[4]);
	adder INST5(a[5],b[5],cout[4],sum[5],cout[5]);
	adder INST6(a[6],b[6],cout[5],sum[6],cout[6]);
	adder INST7(a[7],b[7],cout[6],sum[7],cy_out);
	

endmodule
