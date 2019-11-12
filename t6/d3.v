module d3(in,out);
	input [2:0] in;
	output [2:0] out;
	reg [2:0] out;
	always @(in)
		begin
			out = in;
		end
endmodule 