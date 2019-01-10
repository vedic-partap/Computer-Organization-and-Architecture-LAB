/*
	Rahul Kumar (16CS10042)
	Vedic Partap (16CS10053)
				*/

`timescale 1ns / 1ps
`include "adder.v"
`include "comparator.v"
`include "mux.v"
module sign_mag_adder(input [7:0] a,input [7:0] b,output [8:0] sum);
	
	// Variable Declarion
	wire sign_a; wire sign_b; wire [6:0] mag_a; wire [6:0] mag_b; wire compare; wire c_out;
	wire [6:0] outmux1; wire [6:0] outmux2; wire [6:0] outmux3; wire [6:0] outmux4;wire [6:0] outmux;
	wire sel1, sel2;


	assign sign_a = a[7];
	assign sign_b = b[7];
	assign mag_a = a[6:0];
	assign mag_b = b[6:0];
	assign abxor=sign_a^sign_b;

	// compare magnitudes
	comparator inst1(mag_a, mag_b, compare);
		
	// if(a<=b and signs are different) sel1 = 1, if(signs are same) sel2 = 1
	assign sel1=((compare) & (abxor));
	assign sel2=~(abxor);


	mux INST1(sel1,mag_b,mag_a,outmux);
	assign outmux1=~(outmux);
	mux INST2(sel1,mag_a,mag_b,outmux2);
	mux INST3(sel2,outmux1,mag_a,outmux3);
	mux INST4(sel2,outmux2,mag_b,outmux4);
	adder A(outmux3,outmux4,abxor,sum[6:0],c_out);
	assign sum[7] = abxor?0:c_out;
	assign sum[8] = compare?sign_b:sign_a;

endmodule
