module d13(in,out);
	input [12:0] in;
	output [12:0] out;
	reg [12:0] out;
	always @(in)
		begin
			out = in;
		end
endmodule 