`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:55:59 10/10/2018 
// Design Name: 
// Module Name:    ControlUnit 
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

`define aluAdd 6'b000000
`define aluAddi 6'b000001
`define aluComp 6'b000010
`define aluCompi 6'b000011

`define logAnd 6'b000100
`define logXor 6'b000101

`define SHLL 6'b000110
`define SHRL 6'b000111
`define SHLLV 6'b001000

`define SHRLV 6'b001001
`define SHRA 6'b001010
`define SHRAV 6'b001011

`define LW 6'b010000
`define SW 6'b100000

`define b 6'b110000
`define br 6'b110001
`define bz 6'b110010
`define bnz 6'b110011

`define bcy 6'b110100
`define bncy 6'b110101
`define bs 6'b110110
`define bns 6'b110111

`define bv 6'b111000
`define bnv 6'b111001
`define Call 6'b111010
`define Ret 6'b111011

`define Add 3'b000
`define Comp 3'b001
`define Xor 3'b011
`define And 3'b010
`define None 3'b111

module ControlUnit(
      input[31:0] instruction,
      output reg[2:0] alu_op,
      output reg mem_read,mem_write,alu_src,mem_to_reg,reg_write,
			b,br,bz,bnz,bcy,bncy,bs,bns,bv,bnv,Call,Ret);
			
	always @(instruction)
	begin
	 mem_read=0;mem_write=0;alu_src=0;mem_to_reg=0;reg_write=0;b=0;br=0;bz=0;bnz=0;bcy=0;bncy=0;bs=0;bns=0;bv=0;bnv=0;Call=0;Ret=0;
	 alu_op = `None;
	 case({instruction[31:30], instruction[19:16]})
		`SHLL:
				begin
					alu_src=1'b1;
					alu_op = 3'b100;
					reg_write = 1'b1;
				end
		`SHRL:
				begin
					alu_src=1'b1;
					alu_op = 3'b101;
					reg_write = 1'b1;
				end
		`SHLLV:
				begin
				   alu_src=1'b0;
					alu_op = 3'b100;
					reg_write = 1'b1;
				end

		`SHRLV:
				begin
				   alu_src=1'b0;
					alu_op = 3'b101;
					reg_write = 1'b1;
				end
		`SHRA:
				begin
					alu_src=1'b1;
					alu_op = 3'b110;
					reg_write = 1'b1;
				end
		`SHRAV:
				begin
					alu_op = 3'b110;
					alu_src=1'b0;
					reg_write = 1'b1;
				end

		`LW:  
					begin
						 alu_src = 1;
						 mem_to_reg = 1;
						 mem_read = 1;  
						 alu_op = `Add;  
					end
		`SW:  
					begin
						 alu_src = 1;
						 mem_write = 1;
						 alu_op = `Add;  
					end
		
		`aluAdd:  
					begin
						 reg_write = 1'b1;
						 alu_src=1'b0;
						 alu_op = `Add;
					end
		`aluAddi:  
					begin
						 alu_src = 1;
						 reg_write = 1'b1;
						 alu_op = `Add;
					end
		`aluComp:  
					begin
						 reg_write = 1'b1;
						 alu_src=1'b0;
						 alu_op = `Comp;  
					end
		`aluCompi: 
					begin
						 alu_src = 1'b1;
						 reg_write = 1'b1;
						 alu_op = `Comp;
					end
		
		`logAnd:  
					begin
						 reg_write = 1'b1;
						 alu_src=1'b0;
						 alu_op = `And;   
					end
		`logXor:  
					begin
						 reg_write = 1'b1;
						 alu_src=1'b0;
						 alu_op = `Xor;   
					end
		 
		`b:
			begin
				b=1'b1;
				alu_src=1'b1;
			end
		`br:
			begin
				br=1'b1;
				alu_src=1'b1;
				alu_op=`Add;
			end
		`bz:
			begin
				bz=1'b1;
				alu_src=1'b1;
			end
		`bnz:
			begin
				bnz=1'b1;
				alu_src=1'b1;
			end
		`bcy:
			begin
				bcy=1'b1;
				alu_src=1'b1;
			end
		`bncy:
			begin
				bncy=1'b1;
				alu_src=1'b1;
			end
		`bs:
			begin
				bs=1'b1;
				alu_src=1'b1;
			end
		`bns:
			begin
				bns=1'b1;
				alu_src=1'b1;
			end
		`bv:
			begin
				bv=1'b1;
				alu_src=1'b1;
			end
		`bnv:
			begin
				bnv=1'b1;
				alu_src=1'b1;
			end
		`Call:
			begin
				Call=1'b1;
				alu_op=`Add;
			end
		`Ret:
			begin
				Ret=1'b1;
				alu_op=`Add;
			end
			default: 
				begin
					mem_read=0;mem_write=0;alu_src=0;mem_to_reg=0;reg_write=0;b=0;br=0;bz=0;bnz=0;bcy=0;bncy=0;bs=0;bns=0;bv=0;bnv=0;Call=0;Ret=0;
			   end
		endcase
	end
endmodule