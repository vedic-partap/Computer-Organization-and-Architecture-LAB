/*Helper Module
				*/
`timescale 1ns / 1ps
module dff(
    input clk,
	 input rst,
    input d,
	 input cin,
    output q
    );

	reg q;
	
	always @(posedge clk)	//if reset=0, Q=D, else Q=cin
	begin	
	if(rst == 0)
		q = d;
	else
		q = cin;
	end

endmodule 
