module diffChoose(regA,regB,wreg,x,y,a,b);
	input [7:0] regA;
	input [7:0] regB;
	input [7:0] wreg;
	input x;
	input y;
	output [7:0] a;
	output [7:0] b;
	reg [7:0] a;
	reg [7:0] b;

	always @(x,y,wreg,regA,regB)
		begin
			if(x == 1)
				a = wreg;
			else
				a = regA;
			if(y == 1)
				b = wreg;
			else
				b = regB;
		end
endmodule 