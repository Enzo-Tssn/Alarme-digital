module sete_segmentos 
  (
   input [3:0] Num_Binario,
   output Segmento_A,
   output Segmento_B,
   output Segmento_C,
   output Segmento_D,
   output Segmento_E,
   output Segmento_F,
   output Segmento_G
   );
 
  reg [6:0] Hex_Encoding = 7'h00;
   
  always @(Num_Binario)
    begin
      case (Num_Binario)
        4'b0000 : Hex_Encoding <= 7'h7E;
        4'b0001 : Hex_Encoding <= 7'h30;
        4'b0010 : Hex_Encoding <= 7'h6D;
        4'b0011 : Hex_Encoding <= 7'h79;
        4'b0100 : Hex_Encoding <= 7'h33;          
        4'b0101 : Hex_Encoding <= 7'h5B;
        4'b0110 : Hex_Encoding <= 7'h5F;
        4'b0111 : Hex_Encoding <= 7'h70;
        4'b1000 : Hex_Encoding <= 7'h7F;
        4'b1001 : Hex_Encoding <= 7'h7B;
        4'b1010 : Hex_Encoding <= 7'h77;
        4'b1011 : Hex_Encoding <= 7'h1F;
        4'b1100 : Hex_Encoding <= 7'h4E;
        4'b1101 : Hex_Encoding <= 7'h3D;
        4'b1110 : Hex_Encoding <= 7'h4F;
        4'b1111 : Hex_Encoding <= 7'h47;
      endcase
    end
 
  assign Segmento_A = Hex_Encoding[6];
  assign Segmento_B = Hex_Encoding[5];
  assign Segmento_C = Hex_Encoding[4];
  assign Segmento_D = Hex_Encoding[3];
  assign Segmento_E = Hex_Encoding[2];
  assign Segmento_F = Hex_Encoding[1];
  assign Segmento_G = Hex_Encoding[0];
 
endmodule