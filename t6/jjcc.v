module jjcc(
	input [5:0] opcode,
	input [7:0] a,
	input [7:0] bh,
	input [7:0] bl,
	input [7:0] ch,
	input [7:0] cl,
	output reg[7:0] h,
	output reg[7:0] l,
	output reg[7:0] b,
	output reg check
);
parameter	mul = 6'b000010,
				div = 6'b000100;
always @(*)
begin
	if(opcode == div) begin
			h = ch;
			l = cl;
			b = {8'h00};
			check = 1;
		end
	else if(opcode == mul) begin
			h = bh;
			l = bl;
			b = {8'h00};
			check = 1;
		end
	else begin
			h = {8'h00};
			l = {8'h00};
			b = a;
			check = 0;
		end
end
endmodule 