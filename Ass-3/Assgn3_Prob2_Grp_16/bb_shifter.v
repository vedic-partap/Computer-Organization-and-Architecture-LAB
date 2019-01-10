/*
Rahul Kumar, 16CS10042
Vedic Partap, 16CS10053
*/
`timescale 1ns / 1ps
`include "mux.v"
module bb_shifter (in, shift, direction, out);
	input [7:0] in;
	input [2:0] shift;
	input direction;
	output [7:0] out;

	wire [7:0] O1, O2, out1, out2, out3;
	

	mux INST1(direction,{in[6:0],in[7]},{in[0],in[7:1]},out1);
	mux INST2(shift[0],in,out1,O1);
	mux INST3(direction,{O1[5:0],O1[7:6]},{O1[1:0],O1[7:2]},out2);
	mux INST4(shift[1],O1,out2,O2);
	mux INST5(direction,{O2[3:0],O2[7:4]},{O2[3:0],O2[7:4]},out3);
	mux INST6(shift[2],O2,out3,out);
endmodule 
