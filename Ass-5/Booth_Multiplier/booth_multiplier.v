`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:53:01 08/26/2018 
// Design Name: 
// Module Name:    booth_multiplier 
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
module booth_multiplier(
    input signed[5:0] X,
    input signed[5:0] Y,
	 input clk,
	 input load,
    output reg signed[11:0] Z
    );
	reg [1:0] temp;
	integer i;
	reg E1;
	reg [11:0] Y1;
	always @ (posedge clk) begin
		if(load==0)
				begin
				Z = 12'd0;
				E1 = 1'd0;
				Y1 = - Y;
				Z[11:0]=X;
				i <= 0;
				end
		else
			begin
				if(i<6)
				begin
					temp = {X[i], E1};
					case (temp)
						2'd2 : Z [10 : 0] = {Z [11 : 6] + Y1,Z[5:1]};
						2'd1 : Z [10 : 0] = {Z [11 : 6] + Y,Z[5:1]};
						2'd0 : Z [10 : 0] = {Z[11:1]};
						2'd3 : Z [10 : 0] = {Z[11:1]};
						default : begin end
					endcase
					Z[11] = Z[10];
					E1 = X[i];
					i <= i+1;
				end
			end

	end

endmodule
