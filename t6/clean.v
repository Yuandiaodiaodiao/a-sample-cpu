module clean(
	input clk,
	input clr,
	output reg out
);

always @ (posedge clk)
	begin
		out <= 0;
		if(clr) begin
			out <= 1;
		end else begin
			out <= 0;
		end
	end

endmodule