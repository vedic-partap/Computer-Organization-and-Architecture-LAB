module MUX8(input s, input [15:0] a, input [15:0] b, output reg[15:0] out);
	always @(*) begin
		if(s==0)
			out = a;
		else
			out = b;
	end
endmodule