module diffCheck(pick1,pick2,wdpick3,wBack,a,b,clk);
	input [2:0] pick1;
	input [2:0] pick2;
	input [2:0] wdpick3;
	input wBack;
	input clk;
	output a;
	output b;
	reg a;
	reg b;
	always@(posedge clk)
		begin
			if(pick1 == wdpick3 && wBack==1)
				a = 1;
			else
				a = 0;
			if(pick2 == wdpick3&&wBack==1)
				b = 1;
			else
				b = 0;
		
		end
endmodule 
				