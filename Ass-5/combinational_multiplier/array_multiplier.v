`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:36:31 08/20/2018 
// Design Name: 
// Module Name:    Unsigned_Array_Multiplier 
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
module array_multiplier(
    input [7:0] a,
    input [7:0] b,
    output reg [15:0] m
    );
		
	integer i;
	integer j;
	integer index;
	reg temp, temp_o, c_o;
	
	always @(*) begin
		m = 0;
		
		for(i=0;i<=7;i=i+1)
			begin
				c_o = 0;
				for(j=0;j<=7;j=j+1)
					begin
						temp = a[i]&b[j];
						index = (i+j);
						{c_o, temp_o} = m[index]+temp+c_o;
						m[index] = temp_o;
					end
				index = i+j;
				m[index] = c_o;
			end
		end
		

endmodule
