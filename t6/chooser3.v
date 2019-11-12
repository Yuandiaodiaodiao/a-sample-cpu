module chooser3(
	input [5:0] opcode,
	input [7:0] a,
	input [7:0] b,
	input [7:0] c,
	output reg[7:0] d
);
parameter	op1 = 6'b100010,
				op2 = 6'b100100;
always @(*)
begin
	if(opcode == op1) begin
			d = b;
		end
	else if(opcode == op2) begin
			d = c;
		end
	else begin
			d = a;
		end
end
endmodule 