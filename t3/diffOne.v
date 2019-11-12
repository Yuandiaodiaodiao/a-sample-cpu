module diffOne(regIdA,regIdB,regDataA,regDataB,wd,out,clk);
	input [2:0] regIdA;
	input [2:0] regIdB;
	input [7:0] regDataA;
	input [7:0] regDataB;
	input wd;
	input clk;
	output [7:0] out;
	reg [7:0] out;

	always @(posedge clk)
		begin
			if(wd == 1 && regIdA == regIdB )
				out = regDataB;
			else
				out = regDataA;
		end
endmodule 
				