`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:20:37 10/09/2018 
// Design Name: 
// Module Name:    Alu 
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
module ArithmeticLogicUnit(
    alu_control,	//specifies the alu operation
    operand0, 	//first operand
    operand1, 	//second operand
    ALUResult, 	//alu result
	 carryflag, //carryflag
	 signflag,  //signflag
	 overflowflag,	//overflow flag (underflow as well)
    zflag //zero flag
);

   parameter size=32,aluCSize=3;
   input [aluCSize-1:0] alu_control;
	input [size-1:0] operand0; 
	input [size-1:0] operand1;
	
   output reg [size-1:0] ALUResult;
	output reg	carryflag;
	output reg signflag;	
	output reg overflowflag;
 	output reg zflag;


	always @(*)
	begin
		case (alu_control)
			3'b000: // Signed add
				begin
					{carryflag,ALUResult} = operand0 + operand1;
					if ((operand0 >= 0 && operand1 >= 0 && ALUResult < 0) ||
						(operand0 < 0 && operand1 < 0 && ALUResult >= 0)) 
						begin
							overflowflag = 1;
						end 
					else 
						begin
							overflowflag = 0;
						end						
					zflag = (ALUResult == 0) ? 1 : 0;		
				end
				
			3'b001: // Comp
				begin
					{carryflag,ALUResult} = ~operand1 + 1;
					overflowflag = 0;
					zflag = (ALUResult == 0) ? 1 : 0;
					carryflag = 0;
				end				

			3'b010 : // AND
				begin
					ALUResult = operand0 & operand1;
					overflowflag = 0;
					carryflag = 0;
					zflag = (ALUResult == 0) ? 1 : 0;
				end	
	

			3'b011: // XOR
				begin
					ALUResult = operand0 ^ operand1;
					overflowflag = 0;
					carryflag = 0;
					zflag = (ALUResult == 0) ? 1 : 0;
				end

			3'b100: // shift left
				begin
					ALUResult = operand0 << operand1;
					overflowflag = 0;
					carryflag = 0;
					zflag = (ALUResult == 0) ? 1 : 0;
				end
			3'b101: // shift right
				begin	
					ALUResult = operand0 >> operand1;
					overflowflag 	= 0;
					carryflag = 0;
					zflag = (ALUResult == 0) ? 1 : 0;
				end
		   3'b110: // shift right arithmetic
				begin
					ALUResult = operand0 >>> operand1;
					overflowflag = 0;
					carryflag = 0;
					zflag = (ALUResult == 0) ? 1 : 0;
				end

				
		endcase
		//if ((operand0<0 && operand0>operand1)||(operand1<0 && operand1>operand0))
		if (ALUResult[31] | overflowflag)
			signflag = 1;
		else
			signflag = 0;

		/*$strobe("%t: ALU  ALUop:  %b", $time,alu_control);
		$strobe("%t: ALU  operand0:  %d", $time,operand0);
		$strobe("%t: ALU  operand1:  %d", $time,operand1);
		$strobe("%t: ALU  Res:  %d", $time,ALUResult);
		$strobe("%t: zflag  %b overflowflag %b ", $time, zflag, overflowflag);
		$strobe("%t: signflag  %b carryflag %b ", $time, signflag, carryflag);*/
	end
 endmodule
