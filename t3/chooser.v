module chooser(a,b,x,y,ans);
	input x,y;
	input [4:0]a;
	input [7:0]b;
	output [7:0]ans;
	reg [7:0]ans;
	always@ (x,y)
		begin
			if(x)
				ans = a;
			else if(y)
				ans = b;
			else
				ans = 0;
		end
endmodule 