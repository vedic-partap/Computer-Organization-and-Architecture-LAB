`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:13:18 09/02/2018 
// Design Name: 
// Module Name:    two_complementer 
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
module two_complementer(
    input inp,
    input clk,
    input reset,
    output reg out
    );
	reg state;
	 
	 always@(posedge clk, posedge reset) 
	 begin
		if(reset)
			state <= 0;
		else
			begin
				case(state)
					0:
						begin
							if(inp==0)
								begin
									state <= 0;
									out <= 0;
								end
							else 
							begin
									state <= 1;
									out <= 1;
							end
						end
					1:
						begin
							if(inp==0)
								begin
									state <= 1;
									out <= 1;
								end
							else 
							begin
									state <= 1;
									out <= 0;
							end
						end
			endcase
	 
	 end
	 end

endmodule
