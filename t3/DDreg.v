module DDreg(CLK,CLR,data,ans);
	input CLK,CLR;
	input [31:0] data;
	output [31:0] ans;
	reg [31:0] ans;
	always @(posedge CLK or negedge CLR)
		if(!CLR)
			ans = 0;
		else
			ans = data;
endmodule 