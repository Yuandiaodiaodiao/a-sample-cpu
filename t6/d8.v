module d8(in,out);
	input [7:0] in;
	output [7:0] out;
	reg [7:0] out;
	always @(in)
		begin
			out = in;
		end
endmodule 