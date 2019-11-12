module alu_codex(
	input [7:0]a,
	input [7:0]b,
	input [5:0]opcode,
	output reg[7:0]c,
	input clk
	);
reg[7:0] temp;
parameter   Add = 6'b101001,
				Sub = 6'b000110,
				Zero=6'b000011,
				And = 6'b011011,
				Or = 6'b011110,
				Nor = 6'b000001,
				Slt = 6'b011111,
				Addsub1 = 6'b010011,
				Xor = 6'b101100,
				Adt = 6'b111110,
				Bdt = 6'b110100,
				Nota = 6'b100000,
				Notb = 6'b101010,
				Lshift = 6'b000101,
				Rshift = 6'b000111;
always @(posedge clk)
begin
  case(opcode)
	Add:
		begin
			c = a + b;
		end
   Sub:
		begin
			c = a - b;
		end
	Zero:	
		begin
			c = 8'h00;
		end
	Nor:
		begin
			temp = a|b;
			c = ~temp;
		end
	Slt:
		begin
			if(a > b) begin
				c = {8'b00000001};
			end else begin
				c = {8'b00000000};
			end
		end
	Addsub1:
		begin
			temp=0;
			temp=a[7:0]+b[7:0];
			c=temp;
			temp=0;
			temp=c[7:0]-{1'b1};
			c=temp;
		end
   And:
      begin
			c = a&b;
      end
    Or:
		begin
         c = a|b;
      end
	Xor:
		begin
			c = a^b;
		end
	Adt:
		begin
			c = a;
		end
	Bdt:
		begin
			c = b;
		end
   Nota:
		 begin
			c = ~a;
		 end
	Notb:
		 begin
			c = ~b;
		 end
		 
	Lshift:
     begin
		if(b >= 8) begin
			c = {8'h00};
		end
		else if(b == 7)
			c = {a[0],{7'b0000000}};
		else if(b == 6)
			c = {a[1],a[0],{6'b000000}};
		else if(b == 5)
			c = {a[2],a[1],a[0],{5'b00000}};
		else if(b == 4)
			c = {a[3],a[2],a[1],a[0],{4'b0000}};
		else if(b == 3)
			c = {a[4],a[3],a[2],a[1],a[0],{3'b000}};
		else if(b == 2)
			c = {a[5],a[4],a[3],a[2],a[1],a[0],{2'b00}};
		else if(b == 1)
			c = {a[6],a[5],a[4],a[3],a[2],a[1],a[0],{1'b0}};
		else
			c = {a[7],a[6],a[5],a[4],a[3],a[2],a[1],a[0]};
	  end
  Rshift:
     begin
		if(b >= 8) begin
			c = {8'h00};
		end
		else if(b == 7)
			c = {{7'b0000000},a[7]};
		else if(b == 6)
			c = {{6'b000000},a[7],a[6]};
		else if(b == 5)
			c = {{5'b00000},a[7],a[6],a[5]};
		else if(b == 4)
			c = {{4'b0000},a[7],a[6],a[5],a[4]};
		else if(b == 3)
			c = {{3'b000},a[7],a[6],a[5],a[4],a[3]};
		else if(b == 2)
			c = {{2'b00},a[7],a[6],a[5],a[4],a[3],a[2]};
		else if(b == 1)
			c = {{1'b0},a[7],a[6],a[5],a[4],a[3],a[2],a[1]};
		else
			c = {a[7],a[6],a[5],a[4],a[3],a[2],a[1],a[0]};
	  
	  end
	  
     endcase
   end
endmodule