`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Name     :Vedic Partap
// Roll No. :16CS10053
// Subject  :COA LAB TEST -1 
// File     :Sign-magnitude Binary Multiplier 
// Type     :mux module 
////////////////////////////////////////////////////////////////////////////////
module mux(
    input [5:0] a,
    input [5:0] b,
    input sel,
    output reg [11:0] out
    );
	 always@(sel)
	 begin
		if(sel)
			out <= a;
		else
			out <= b;
	 end


endmodule
