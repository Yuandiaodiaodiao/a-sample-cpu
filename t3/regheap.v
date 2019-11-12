module regheap(CLK,pick1,pick2,wdpick,data,wd,R1,R2);

	input CLK;
	input [2:0] pick1;
	input [2:0] pick2;
	input [2:0] wdpick;
	input [7:0] data;
	input wd;
	output [7:0] R1;
	output [7:0] R2;
	reg [7:0] R1;
	reg [7:0] R2;
	reg [7:0] R[7:0];
	always @(posedge CLK)
		begin
			if(wd==1)
				R[wdpick]=data;
			if(wdpick==pick1&&wd==1)
				R1=data;
			else
				R1=R[pick1];
			if(wdpick==pick2&&wd==1)
				R2=data;
			else
				R2 = R[pick2];
		end
endmodule