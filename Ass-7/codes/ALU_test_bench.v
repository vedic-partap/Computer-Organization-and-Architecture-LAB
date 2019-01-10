`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:47:52 11/05/2018
// Design Name:   ArithmeticLogicUnit
// Module Name:   /home/vernwalrahul/5th Sem/CoA/S_C_CPU_Group_16/ALU_test_bench.v
// Project Name:  S_C_CPU_Group_16
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ArithmeticLogicUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_test_bench;

	// Inputs
	reg [2:0] alu_control;
	reg [31:0] operand0;
	reg [31:0] operand1;

	// Outputs
	wire [31:0] ALUResult;
	wire carryflag;
	wire signflag;
	wire overflowflag;
	wire zflag;

	// Instantiate the Unit Under Test (UUT)
	ArithmeticLogicUnit uut (
		.alu_control(alu_control), 
		.operand0(operand0), 
		.operand1(operand1), 
		.ALUResult(ALUResult), 
		.carryflag(carryflag), 
		.signflag(signflag), 
		.overflowflag(overflowflag), 
		.zflag(zflag)
	);

	initial begin
		// Initialize Inputs
		alu_control = 0;
		operand0 = 8;
		operand1 = 6;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	integer i;
   always
	begin
		for(i=0; i<8; i=i+1)
		begin
         alu_control = i;
			#100;
		end
	end
endmodule

