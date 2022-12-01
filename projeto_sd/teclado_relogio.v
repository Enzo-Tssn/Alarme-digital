module teclado_relogio (lin, col, s);

   input [3:0] lin, col;
	output [3:0] s;
	
	reg [3:0] s;
	
   if (lin == 1 && col == 4) //Zero (lin = 0001 e col = 0100)
	      begin s = 0; end
	if (lin == 8 && col == 8) //Um (lin = 1000 e col = 1000)
	      begin s = 1; end
	if (lin == 8 && col == 4) //Dois (lin = 1000 e col = 0100)
	      begin s = 2; end
	if (lin == 8 && col == 2) //Tres (lin = 1000 e col = 0010)
	      begin s = 3; end
	if (lin == 4 && col == 8) //Quatro (lin = 0100 e col = 1000)
	      begin s = 4; end
	if (lin == 4 && col == 4) //Cinco (lin = 0100 e col = 0100)
	      begin s = 5; end
	if (lin == 4 && col == 2) //Seis (lin = 0100 e col = 0010)
	      begin s = 6; end
	if (lin == 2 && col == 8) //Sete (lin = 0010 e col = 1000)
	      begin s = 7; end
	if (lin == 2 && col == 4) //Oito (lin = 0010 e col = 0100)
	      begin s = 8; end
	if (lin == 2 && col == 2) //Nove (lin = 0010 e col = 0010)
	      begin s = 9; end
	if (lin == 1 && col == 8) //Nao (lin = 0001 e col = 1000)
	      begin s = 10; end
	if (lin == 1 && col == 2) //Sim (lin = 0001 e col = 0010)
	      begin s = 11; end
	if (lin == 8 && col == 0) //Config (lin = 0001 e col = 0010)
	      begin s = 12; end

endmodule