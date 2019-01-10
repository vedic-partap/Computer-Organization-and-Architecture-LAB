/*Test Bench
				*/
`timescale 1ns / 1ps
module ripple_carry_adder_tb;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg cy_in;

	// Outputs
	wire [7:0] sum;
	wire cy_out;

	// Instantiate the Unit Under Test (UUT)
	ripple_carry_adder uut (
		.a(a), 
		.b(b), 
		.cy_in(cy_in), 
		.sum(sum), 
		.cy_out(cy_out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cy_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a=8'b00000001;
		b=8'b01000101;
		cy_in=1;
		#100;
        $display("%d, %d, %d",a,b,sum);

	end
      
endmodule

