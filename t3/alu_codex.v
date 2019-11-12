module alu_codex(a,b,opcode,c,clk);
output [7:0] c;
input clk;
input [7:0] a;
input [7:0] b;
input[5:0] opcode;
reg[7:0] c;
reg[7:0] temp;
parameter   Add = 6'b101001,
				Sub = 6'b000110,
				Zero=6'b000011,
				And = 6'b011011,
				Or = 6'b011110,
				Add1 = 6'b000001,
				Sub1 = 6'b011111,
				Addsub1 = 6'b010011,
				Xor = 6'b101100,
				Adt = 6'b111110,
				Bdt = 6'b110100,
				Nota = 6'b100000,
				Notb = 6'b101010;
always @(posedge clk)
begin
  case(opcode)
  Add:
	  begin
	 	  temp=0;
		  temp=a[7:0]+b[7:0];
		  c=temp[7:0];
	  end
   Sub:
		begin
		   temp=0;
		   temp=a[7:0]-b[7:0];
		   c=temp[7:0];
		end
	Zero:
		begin
			c=8'b00000000;
		end
	Add1:
		begin
			temp=0;
			temp=a[7:0]+{1'b1};
			c=temp[7:0];
		end
	Sub1:
		begin
			temp=0;
			temp=a[7:0]-{1'b1};
			c=temp[7:0];
		end
	Addsub1:
		begin
			temp=0;
			temp=a[7:0]+b[7:0];
			c=temp[7:0];
			temp=0;
			temp=c[7:0]-{1'b1};
			c=temp[7:0];
		end
   And:
      begin
			c=a&b;
      end
    Or:
		begin
         c=a|b;
      end
	Xor:
		begin
			c=a^b;
		end
	Adt:
		begin
			c=a;
		end
	Bdt:
		begin
			c=b;
		end
   Nota:
		 begin
			 c=~a;
		 end
	Notb:
		 begin
			 c=~b;
		 end
     endcase
   end
endmodule