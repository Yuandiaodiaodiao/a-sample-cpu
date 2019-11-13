module alu_v2(
input [5:0]opcode,
	input [7:0]x,
	input [7:0]y,
		input [7:0]jumpNum,
	output reg[7:0] out
);
parameter   Beq = 6'b001000,
				Bne = 6'b001001,
				Jr  = 6'b001010,
				Beqz= 6'b001011,
				Benz= 6'b001100;
always @ (*)
	begin
		case(opcode)
			Beq:
				begin
					if(x == y) begin
						out = jumpNum;
					end else begin
						out = {8'b00000001};
					end
				end
			Bne:
				begin
					if(x != y) begin
						out = jumpNum;
					end else begin
						out = {8'b00000001};
					end
				end
			Jr :
				begin out = x; end
			Beqz:
				begin
					if(x == 0) begin
						out = jumpNum;
					end else begin
						out = {8'b00000001};
					end
				end
			Benz:
				begin
					if(x != 0) begin
						out = jumpNum;
					end else begin
						out = {8'b00000001};
					end
				end
		endcase
	end
endmodule 