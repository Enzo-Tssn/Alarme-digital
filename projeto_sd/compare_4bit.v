module compare_4bit (igual, maior, menor, A, B);
    input [3:0] A, B; //vetor de 4 bits com o menos significativo à direita
    output igual, maior, menor;
    wire [3:0] aux_ig, aux_ma, aux_me; //conexão de 4 bits, variáveis auxiliares
    
    compare_1bit BL3(aux_ig[3], aux_ma[3], aux_me[3], A[3], B[3],1);
    compare_1bit BL2(aux_ig[2], aux_ma[2], aux_me[2], A[2], B[2],aux_ig[3]);
    compare_1bit BL1(aux_ig[1], aux_ma[1], aux_me[1], A[1], B[1],aux_ig[2]);
    compare_1bit BL0(aux_ig[0], aux_ma[0], aux_me[0], A[0], B[0],aux_ig[1]);
    
    assign maior = | aux_ma; //realiza OR em todos bits do vetor aux_ma
    assign menor = | aux_me; //realiza OR em todos bits do vetor aux_me
    assign igual = aux_ig[0];

endmodule