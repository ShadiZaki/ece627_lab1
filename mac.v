module mac #(parameter D_W = 32)(
	input clk,
	input rst,
	input [D_W-1:0] a,
	input [D_W-1:0] b,
	input initialize,
	output reg [2*D_W-1:0] result);

	reg [2*D_W-1:0] temp;

	always @(posedge clk) 
	begin
		if(!rst)
		begin
			if(!initialize)
			begin
				temp <= a * b;
				result <= result + temp;
			end
			else
			begin
				temp <= a * b;
				result <= temp;
			end
		end
		else
		begin
			temp <= 0;
			result <= 0;
		end
	end
endmodule

