/*Test Bench
				*/
`timescale 1ns / 1ps
module bitSerialAdder_tb;

	// Inputs
	reg clk;
	reg rst_shift;
	reg rst_ff;
	reg load;
	reg sipo_load;
	reg [7:0] a;
	reg [7:0] b;
	reg cin;

	// Outputs
	wire [7:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	bitSerialAdder uut (
		.clk(clk), 
		.rst_shift(rst_shift), 
		.rst_ff(rst_ff), 
		.load(load), 
		.sipo_load(sipo_load), 
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_shift = 0;
		rst_ff = 1;
		load = 1'b1;
		sipo_load = 0;
		a = 8'b01101001;
		b = 8'b00110100;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#50
		rst_ff = 1'b0;
		
		#400
		load = 1'b0;
		
	end
	
	always
		#25 clk = !clk;
		
   initial begin
		#850 sipo_load = 1'b1;
		$display("%d, %d, %d", a, b, sum);
	end
	
endmodule


