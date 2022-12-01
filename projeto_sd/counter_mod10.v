module counter_mod10 (clk, reset, count);

	input clk, reset;
	output [3:0] count;

	wire reset_comb;
	reg [3:0] reg_count;
	
	assign count = reg_count;
	assign reset_comb = (reset & ((reg_count == 4'b1001) ? 1'b0 : 1'b1));
	
	always @ (posedge clk) begin
		
		if (!reset_comb) reg_count <= 4'b0000;
		else reg_count <= reg_count + 1'b1;
		
	end

endmodule