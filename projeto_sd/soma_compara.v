module soma_compara (a_dez, a_uni, b_dez, b_uni, lin, col, bot_press, s,
   seg0, seg1, seg2, seg3, seg4, seg5, seg6, seg7, seg8, seg9, seg10, seg11, seg12, seg13,
	seg14, seg15, seg16, seg17, seg18, seg19, seg20, seg21, seg22, seg23, seg24, seg25, seg26, seg27);

	input [3:0] a_dez, a_uni, b_dez, b_uni, lin, col;
	input bot_press;
	output s, seg0, seg1, seg2, seg3, seg4, seg5, seg6, seg7, seg8, seg9, seg10, seg11, seg12, seg13,
	seg14, seg15, seg16, seg17, seg18, seg19, seg20, seg21, seg22, seg23, seg24, seg25, seg26, seg27;
	
	//Permite a representacao dos numeros em displays de 7 segmentos
	sete_segmentos a0 (a_dez, seg0, seg1, seg2, seg3, seg4, seg5, seg6);
	sete_segmentos a1 (a_uni, seg7, seg8, seg9, seg10, seg11, seg12, seg13);
	sete_segmentos b0 (b_dez, seg14, seg15, seg16, seg17, seg18, seg19, seg20);
	sete_segmentos b1 (b_uni, seg21, seg22, seg23, seg24, seg25, seg26, seg27);
	
	wire [11:0] num_somado, num_digitado;
	wire carry;
	
	//Soma os numeros, sendo o resultado um numero de 12 bits (4 bits para cada digito)
	somador_bcd (a_uni, b_uni, 0, num_somado[3:0], carry);
	somador_bcd (a_dez, b_dez, carry, num_somado[7:4], num_somado[11:8]);
	
	//Recebe o valor digitado
	teclado_conta (lin, col, bot_press, num_digitado);
	
	/*Compara a soma dos numeros aleatorios com o numero digitado
	  Se forem iguais, a saida eh 1 e o alarme pode ser desligado*/
	comparador (num_somado, num_digitado, s);
	
endmodule
