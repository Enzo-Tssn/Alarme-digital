module tb_DFlipFlop;

	//Inputs
	reg d, clk;
	
	//Output
	wire q, q1;
	
	integer i;
	
	//Instancia a unidade a ser testada
	DFlipFlop uut(
		.d(d),
		.clk(clk),
		.q(q),
		.q1(q1)
	);
	
	//Pulso do clock
	always begin
		clk = 1'b0; #10;
		clk = 1'b1; #10;
	end
	
	initial begin
		for (i = 0;i < 2; i = i+1) //Testa d = 0 e d = 1
		begin
			d = i;
			#20;
		end
		$finish;
	end
	
endmodule