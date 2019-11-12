module iszero(a,b,ans);
	input [7:0]a;
	input [7:0]b;
	output [7:0]ans;
	reg [7:0] ans;
	always@(a,b)
		begin
			if(a == 0)
				ans = b;
			else
				ans = {8'b00000010};
		end
endmodule 