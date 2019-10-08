module mypc(CLK,CLR,cnt);
	input CLK,CLR;
	output [7:0] cnt;
	reg[7:0] cnt;
	reg flag = 0;
	always@(posedge CLK or posedge CLR)
	begin
		if(CLR)
			cnt = 0;
		else if(CLK)
			if(flag)
				cnt = cnt + {1'b1};
			else
				flag = 1;
	end
endmodule