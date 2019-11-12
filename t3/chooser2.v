module chooser2(op,z,x,y,a,b,c);
	input [1:0] op;
	input [7:0] x;
	input [7:0] y;
	input [7:0] z;
	output [7:0]a;
	output [7:0]b;
	output [7:0]c;
	//abc ab bc ac
	reg [7:0]a;
	reg [7:0]b;
	reg [7:0]c;
	parameter zero = 2'b00,
				  dt  = 2'b01,
				yzab  = 2'b10,
				xzab	= 2'b11;
	always @(op or x or y or z)
		begin
			case(op)
				zero:
					begin
						a = 0;
						b = 0;
						c = 0;
					end
				dt:
					begin
						a = x;
						b = y;
						c = z;
					end
				yzab:
					begin
						a = y;
						b = z;
						c = x;
					end
				xzab:
					begin
						a = x;
						b = z;
						c = y;
					end
			endcase
		end
endmodule 
				