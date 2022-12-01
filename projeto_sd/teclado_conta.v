module teclado_conta (lin, col, bot_press, s);

	/*Tratando o teclado como uma matriz 4x4, como abaixo
	
								1 2 3 A
								4 5 6 B
								7 8 9 C
								* 0 # D
								
	Cada botao pode ser representado por duas "coordenadas",
	no caso, linha e coluna da matriz*/
	
	input [3:0] lin, col;
	input bot_press;
	output [11:0] s;
	
	reg [11:0] s;
	reg [3:0] uni, dez, cent;
	reg [1:0] aux = 2'b00;
	
	always @(posedge bot_press)
	begin
		aux = aux + 1;
		if (lin == 1 && col == 2) //"Enter" (lin = 0001 e col = 0010)
		begin
			aux = 0; 
			s = {cent, dez, uni}; //Concatena os numeros
			uni = 0;
			dez = 0; //Retorna os valores a 0 para que outro numero possa ser digitado
			cent = 0;
		end
		if (lin == 1 && col == 4) //Zero (lin = 0001 e col = 0100)
		begin
			if (aux == 1) begin uni = 0; end
			if (aux == 2) begin dez = 0; end
			if (aux == 3) begin cent = 0; end
		end
		if (lin == 8 && col == 8) //Um (lin = 1000 e col = 1000)
		begin
			if (aux == 1) begin uni = 1; end
			if (aux == 2) begin dez = 1; end
			if (aux == 3) begin cent = 1; end
		end
		if (lin == 8 && col == 4) //Dois (lin = 1000 e col = 0100)
		begin
			if (aux == 1) begin uni = 2; end
			if (aux == 2) begin dez = 2; end
			if (aux == 3) begin cent = 2; end
		end
		if (lin == 8 && col == 2) //Tres (lin = 1000 e col = 0010)
		begin
			if (aux == 1) begin uni = 3; end
			if (aux == 2) begin dez = 3; end
			if (aux == 3) begin cent = 3; end
		end
		if (lin == 4 && col == 8) //Quatro (lin = 0100 e col = 1000)
		begin
			if (aux == 1) begin uni = 4; end
			if (aux == 2) begin dez = 4; end
			if (aux == 3) begin cent = 4; end
		end
		if (lin == 4 && col == 4) //Cinco (lin = 0100 e col = 0100)
		begin
			if (aux == 1) begin uni = 5; end
			if (aux == 2) begin dez = 5; end
			if (aux == 3) begin cent = 5; end
		end
		if (lin == 4 && col == 2) //Seis (lin = 0100 e col = 0010)
		begin
			if (aux == 1) begin uni = 6; end
			if (aux == 2) begin dez = 6; end
			if (aux == 3) begin cent = 6; end
		end
		if (lin == 2 && col == 8) //Sete (lin = 0010 e col = 1000)
		begin
			if (aux == 1) begin uni = 7; end
			if (aux == 2) begin dez = 7; end
			if (aux == 3) begin cent = 7; end
		end
		if (lin == 2 && col == 4) //Oito (lin = 0010 e col = 0100)
		begin
			if (aux == 1) begin uni = 8; end
			if (aux == 2) begin dez = 8; end
			if (aux == 3) begin cent = 8; end
		end
		if (lin == 2 && col == 2) //Nove (lin = 0010 e col = 0010)
		begin
			if (aux == 1) begin uni = 9; end
			if (aux == 2) begin dez = 9; end
			if (aux == 3) begin cent = 9; end
		end
	end
	
endmodule