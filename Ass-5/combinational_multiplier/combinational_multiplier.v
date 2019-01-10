`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:31:35 08/20/2018 
// Design Name: 
// Module Name:    two_complement_mul 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
////////////////////////////////////////////////////////////////////////////////////
`include "array_multiplier.v"
`include "MUX16.v"
`include "MUX8.v"
module combinational_multiplier(
    input [7:0] a,
    input [7:0] b,
    output [15:0] m
    );
	reg sign;

	always @(*) begin
		sign = a[7]^b[7];
	end
	
	wire [7:0] a1;
	wire [7:0] a2;
	wire [15:0] inter;

	MUX8 INST1(a[7], a, ~a+1, a1);
	MUX8 INST2(b[7], b, ~b+1, a2);

	array_multiplier uam(a1, a2, inter);
	MUX16 INST3(sign, inter, ~inter+1, m);
endmodule
