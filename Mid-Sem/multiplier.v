`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Name     :Vedic Partap
// Roll No. :16CS10053
// Subject  :COA LAB TEST -1 
// File     :Sign-magnitude Binary Multiplier 
// Type     :multiplier module 

////////////////////////////////////////////////////////////////////////////////

`include "mux.v"   // This module was added for just for the code commented ( not used in new code)

module multiplier(
    input [5:0] a, // First Number  
    input [5:0] b, // Second Number 
	 input clk,     //clock
	 input start,   // flag to start the multiplication
	 output reg done, // flag to denote that the multiplication is over
    output reg [11:0] product  // output of multiplication
    );
	 
	// Internal Variable 
	reg [1:0] xj;
	reg  [11:0] P,P_next,temp_add;
	// reg  [11:0] P0,P1,P2,P3,P4,P5,P6; These are required for the method commented below 
	integer i; // counter for the iteration 
	reg E1;
	reg [11:0] Y1;
	
	// triggered on positive edge pf clock
	always @ (posedge clk) begin
	//check if the multiplication has to start or not 
		if(start==0)
				begin
				// Initilaise the varible 
					product = 12'd0;
					E1 = 1'd0;
					done =0;
					Y1 =- b;
					product[11:0]= a;
					P = 0;
					// P1=0;P2 =0;P3=0;P4=0;P5=0;P6=0;P0=0;
					i <= 0;
				end
		// Multiplication start 
		else
			begin
				if(i<6) // condition to continue multiplication 
				begin

						P_next = P;
						
						// This is idea for implementation using MUX ( Pi or Pi+Y selecte dby xj )
						/*case(i)
							0: begin mux Int1(b,1'd0,a[0],temp_add); P1 = P1+temp_add; P2 = P1/2; end; 
							1: begin mux Int2(b,1'd0,a[1],temp_add); P2 = P2+temp_add; P3 = P2/2; end;
							2: begin mux Int3(b,1'd0,a[2],temp_add); P3 = P3+temp_add; P4 = P3/2; end;
							3: begin mux Int4(b,1'd0,a[3],temp_add); P4 = P4+temp_add; P5 = P4/2; end;
							4: begin mux Int5(b,1'd0,a[4],temp_add); P5 = P5+temp_add; P6 = P5/2; end;
							5: begin mux Int6(b,1'd0,a[5],temp_add); P6 = P6+temp_add;  end
						endcase
						*/
						xj = {a[i], E1};
						
						// little manipulation and condition on xj 
						case (xj)
							2'd2 : product[10 : 0] = {product [11 : 6] + Y1,product[5:1]}; // kind of MUX depending on xj
							2'd1 : product[10 : 0] = {product [11 : 6] + b,product[5:1]};
							2'd0 : product[10 : 0] = {product[11:1]};
							2'd3 : product[10 : 0] = {product[11:1]};
							default : begin end
						endcase
						if ( i<5)begin P_next = P >> 1; end // Right Shift 
						product[11] = product[10];
						E1 = a[i];
						
					if (i==5)// last iteration 
						begin
							P[11:0] = product[11:0];
						end
					i <= i+1;
				end
				else 
					begin
					// completeing the multiplication and updating output 
						product = P;
						done = 1;
					end
			end

	end

endmodule
