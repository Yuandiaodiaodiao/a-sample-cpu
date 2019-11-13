module swapit(op,x,a,b,c,d);
	input [1:0] op;
	input [15:0] x;
	output [2:0] a;
	output [2:0] b;
	output [2:0] c;
	output [2:0] d;
	reg [2:0] a;
	reg [2:0] b;
	reg [2:0] c;
	reg [7:0] d;
	parameter   A = 2'b00,
					B = 2'b01,
					C = 2'b10,
					D = 2'b11;
	always @(*)
		begin
			case(op)
				A:
					begin 
						a = x[10:8];
						b = x[7:5];
						c = x[4:2];
						d = {8'b00000000};
					end
				B:
					begin 
						a = x[10:8];
						b = x[7:5];
						c = x[4:2];
						d = {3'b000,x[4:0]};
					end
				C:
					begin 
						a = x[10:8];
						b = x[10:8];
						c = x[7:5];
						d = {3'b000,x[4:0]};
					end 
				D:
					begin 
						a = x[10:8];
						b = x[10:8];
						c = {3'b000};
						d = x[7:0];
					end 
			endcase 
		end 
endmodule 