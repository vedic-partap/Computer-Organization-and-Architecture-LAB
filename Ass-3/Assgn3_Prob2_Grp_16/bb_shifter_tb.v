
`timescale 1ns / 1ps
module bb_shifter_tb;

	// Inputs
	reg [7:0] in;
	reg [2:0] shift;
	reg direction;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	bb_shifter uut (
		.in(in), 
		.shift(shift), 
		.direction(direction), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		shift = 0;
		direction = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in=8'b01000000;
		shift=3'b001;
		direction=0;
	end
      
endmodule

