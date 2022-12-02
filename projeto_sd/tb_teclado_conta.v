module tb_teclado_conta;

	//Inputs
	reg [3:0] lin, col;
	reg bot_press;
	
	//Output
	wire [11:0] s;
	
	//Instancia a unidade a ser testada
	teclado_conta uut (
		.lin(lin),
		.col(col),
		.bot_press(bot_press),
		.s(s)
	);
	
	always begin
		bot_press = 1'b1; #10;
		bot_press = 1'b0; #10;
	end
	
	//Valores quaisquer para teste
	initial begin
		lin = 8; col = 4; #20; //2
		lin = 4; col = 2; #20; //6
		lin = 2; col = 8; #20; //7
		lin = 1; col = 2; //"Enter"
		$monitor("Saida s (BCD) e seu respectivo valor decimal: %12b %x", s, s); #20
		lin = 2; col = 4; #20; //8
		lin = 1; col = 2; //"Enter"
		$monitor("Saida s (BCD) e seu respectivo valor decimal: %12b %x", s, s); #20
		lin = 4; col = 8; #20; //4
		lin = 2; col = 2; #20; //9
		lin = 8; col = 2; #20; //3
		lin = 1; col = 2; //"Enter"
		$monitor("Saida s (BCD) e seu respectivo valor decimal: %12b %x", s, s); #20
		lin = 1; col = 4; #20; //0
		lin = 4; col = 4; #20; //5
		lin = 1; col = 2; //"Enter"
		$monitor("Saida s (BCD) e seu respectivo valor decimal: %12b %x", s, s);
		$finish;
	end
	
endmodule