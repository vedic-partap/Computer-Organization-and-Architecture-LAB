`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:07:30 08/29/2018 
// Design Name: 
// Module Name:    fsm 
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
//////////////////////////////////////////////////////////////////////////////////
module fsm(
    input a,
    input clk,
    input reset,
    output reg b
    );
	reg [1:0]s;
	initial begin
		s = 2'b00;
	end
	always @(posedge clk) begin
		if(reset==1) begin
			s = 2'b00;
			b = 1;
		end
		else 
		begin
			if(s==2'b00) 
			begin
				if(a==0)
					b = 1;
				else begin
					b = 0;
					s = 2'b01;
				end
			end
			else if(s==2'b01) 
			begin
				if(a==0) begin
					s = 2'b10;
					b = 0;
				end
				else begin
					b = 1;
					s = 2'b00;
				end
			end
			
			else if(s==2'b10) 
			begin
				b = 0;
				if(a==0)
					s = 2'b01;
			end
		end
	end

endmodule
