`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:37:59 10/10/2018 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(clk,
							reset,
							reg_write, 
							read_reg_1,read_reg_2,
							write_register,
							write_data,
							read_data_1,read_data_2);
	 parameter size=32,led_register = 25;
	 input    clk;
	 input    reset;
	 // write port
	 input  reg_write;
	 input  [4:0] write_register;
	 input  [size-1:0] write_data;
	 //read port 1
	 input  [4:0]  read_reg_1;
	 output   [size-1:0] read_data_1;
	 //read port 2
	 input  [4:0]  read_reg_2;
	 output  [size-1:0] read_data_2;

	 reg [size-1:0] RF [size-1:0] ;
	 
	
	 integer i,j;
	  
	 assign read_data_2 = RF[read_reg_2];
	 assign read_data_1 = RF[read_reg_1];
	 assign led_output = RF[led_register];
	 
//	 always @(reset)
//	 begin
//	  for(i=0;i<size;i=i+1)
//			RF[i] = 32'b00000000000000000000000000000000;
//	 end
	 always @(posedge clk )
	 begin
		if (reset)
		begin
			for(i=0;i<size;i=i+1)
				RF[i] <= 32'b00000000000000000000000000000000;
			RF[led_register]<=32'b11111111111111111111111111111111;
		end
		if(reg_write) 
		   RF[write_register] <= write_data;
		//$strobe("%t: Write_reg %b Write Data %b", $time, reg_write, RF[write_register]);
	 end

	
endmodule
