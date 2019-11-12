module d13(in,out);
	input [12:0] in;
	output reg [12:0] out;
	always @(*)
		begin
			out = in;
		end
endmodule 