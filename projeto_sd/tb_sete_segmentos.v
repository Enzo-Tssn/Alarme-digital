module tb_sete_segmentos;

	//Input
	reg [3:0] Num_Binario;
	
	//Outputs
	wire Segmento_A,
   Segmento_B,
   Segmento_C,
   Segmento_D,
   Segmento_E,
   Segmento_F,
   Segmento_G;
	
	integer i;
	
	//Instancia a unidade a ser testada
	sete_segmentos uut (
		.Num_Binario(Num_Binario),
		.Segmento_A(Segmento_A),
		.Segmento_B(Segmento_B),
      .Segmento_C(Segmento_C),
		.Segmento_D(Segmento_D),
		.Segmento_E(Segmento_E),
		.Segmento_F(Segmento_F),
		.Segmento_G(Segmento_G)
	);
	
	//Inputs de teste
	initial begin
        for(i = 0;i < 16;i = i+1)
        begin
            Num_Binario = i; 
            #20;
        end     
    end
	
endmodule