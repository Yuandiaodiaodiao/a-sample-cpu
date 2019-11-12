module myand(x,y,a,b,c);
output [7:0] c;
input [7:0] a;
input [7:0] b;
input x,y;
reg[7:0] c;

always @(x or y)
begin
	if(x)
		c = a;
	else if(y)
		c = b;
	else
		c = {8'b00000000};
end
endmodule