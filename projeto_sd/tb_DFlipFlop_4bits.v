module tb_DFlipFlop_4bits;

	//Inputs
	reg [3:0] s;
	reg clk;
	
	//Output
	wire [3:0] q;
	
	integer i;
	
	DFlipFlop_4bits uut(
		.s(s),
		.clk(clk),
		.q(q)
	);
	
	//Pulso do clock
	always begin
		clk = 1'b0; #10;
		clk = 1'b1; #10;
	end
	
	//Testa todas os valores possiveis de s 
	initial begin
		for (i = 0;i < 16; i = i+1)
		begin
			s = i;
			#20;
		end
		$finish;
	end
	
endmodule