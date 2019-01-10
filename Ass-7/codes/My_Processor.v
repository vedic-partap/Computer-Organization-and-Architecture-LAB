`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:05:57 10/10/2018 
// Design Name: 
// Module Name:    G9Processor 
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
module My_Processor(clk, reset);
	parameter	size=32,hsize=16,opsize=2, funcsize = 4, MemSize=512,RegFileSize=5;
	wire  [4:0] RA = 5'b11111;
	
	input	clk;
	input reset;
	
	wire [size-1:0] address;
	
	wire [size-1:0] instruction;
	//output wire  instructiono;
	
	wire [RegFileSize-1:0] read_reg_1;
	wire [RegFileSize-1:0] read_reg_2;
	wire [RegFileSize-1:0] write_register; 
	wire [RegFileSize-1:0] write_registeri;
	wire [size-1:0] write_data;
	wire [size-1:0]write_datai;
	
	wire [size-1:0] reg_read_data_1;

	wire [size-1:0] reg_read_data_2;
	wire [size-1:0] read_data_2;
	wire [size-1:0] RA_data;
	wire [size-1:0] temp;
	
	wire [size-1:0] pc;
	//output wire  pco;
	wire [size-1:0] pc_4;
	wire [size-1:0] pc_branch_target;
	
	wire [opsize-1:0] OpCode;
	wire [funcsize-1:0] func;
	wire [2:0] AluOp;
	//output wire AluOpo;
	
	wire [hsize-1:0] imm16;
	wire [size-1:0] imm32;
	//output wire  imm32o;
	
	
	wire [size-1:0] ALUResult;
	wire 	 carryflag,	 signflag, overflowflag,zflag ,branch;
	
	wire mem_read,mem_write,alu_src,mem_to_reg,reg_write,b,br,bz,bnz,bcy,bncy,bs,bns,bv,bnv,Call,Ret;
	wire [size-1:0] read_data;

	ProgramCounter PC(.clk(clk), 
							.reset(reset), 
							.pc_4(pc_4),
							.branch(branch), 
							.pc_branch_target(pc_branch_target),
							.pc(pc));
   //assign led_output = pc;
	InstructionMemoryi IMem(.clka(clk),
								  .rsta(reset),
								  .addra(pc), 
								  .douta(instruction));
						
	
	
	
	assign imm16 = instruction[15:0];//imm
	
	SignExtend SE(imm16, imm32);
	
	ControlUnit CU(instruction, AluOp,
						mem_read,mem_write,alu_src,mem_to_reg,reg_write,
						b,br,bz,bnz,bcy,bncy,bs,bns,bv,bnv,Call,Ret);
						
	assign read_reg_1 = (Ret) ? RA : instruction[29:25];//rs
   assign read_reg_2 = instruction[24:20];//rt
	
	assign write_registeri = (Call)? RA : instruction[29:25];//rs<-rs opp rt
	assign write_register = (mem_to_reg)? read_reg_2:write_registeri;
	
	RegisterFile RF(.clk(clk),
						 .reset(reset),
						 .reg_write(reg_write|Call|mem_to_reg),
						 .read_reg_1(read_reg_1),.read_reg_2(read_reg_2),
						 .write_register(write_register),
						 .write_data(write_data),
						 .read_data_1(reg_read_data_1),
						 .read_data_2(reg_read_data_2));
	

	
	assign read_data_2 = (alu_src==1'b1) ? imm32 : reg_read_data_2;
						
	ArithmeticLogicUnit ALU (
		.alu_control(AluOp), 
		.operand0(reg_read_data_1), 
		.operand1(read_data_2), 
		.ALUResult(ALUResult), 
		.carryflag(carryflag), 
		.signflag(signflag), 
		.overflowflag(overflowflag), 
		.zflag(zflag)
	 );
	
	 assign pc_4 = pc + 1;
	 assign pc_branch_target = (Ret | br == 1'b1 )?reg_read_data_1 : pc_4 + imm32;
	 
	 assign branch = (zflag & bz == 1'b1) 
						|(~zflag & bnz == 1'b1) 
						|(carryflag & bcy == 1'b1)
						|(~carryflag & bncy == 1'b1)
						|(signflag & bs == 1'b1)
						|(~signflag & bns == 1'b1)
						|(overflowflag & bv == 1'b1)
						|(~overflowflag & bnv == 1'b1)
						|(b == 1'b1)
						|(br == 1'b1)
						| Ret;
	 
	
	 DataMemory DMem (
		.clk(clk), 
		.reset(reset),
		.address(ALUResult), // imm +(rs)
		.mem_write(mem_write), 
		.mem_read(mem_read), 
		.write_data(reg_read_data_2), //(rt)
		.read_data(read_data)
	 );
	 assign write_datai = (mem_to_reg == 1)?  read_data: ALUResult;
	 assign write_data = (Call)?pc_4:write_datai;
	
endmodule
