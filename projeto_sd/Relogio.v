module relogio (lin, col, bot_press, s, buzzer,
                seg0, seg1, seg2, seg3, seg4, seg5, seg6, seg7, seg8, seg9, seg10, seg11, seg12, seg13,
	             seg14, seg15, seg16, seg17, seg18, seg19, seg20, seg21, seg22, seg23, seg24, seg25, seg26, seg27,
					 seg28, seg29, seg30, seg31, seg32, seg33, seg34, seg35, seg36, seg37, seg38, seg39, seg40, seg41);

   input [3:0] lin, col;
	input bot_press;
	
	output [3:0] s;
	output buzzer, seg0, seg1, seg2, seg3, seg4, seg5, seg6, seg7, seg8, seg9, seg10, seg11, seg12, seg13,
	             seg14, seg15, seg16, seg17, seg18, seg19, seg20, seg21, seg22, seg23, seg24, seg25, seg26, seg27,
					 seg28, seg29, seg30, seg31, seg32, seg33, seg34, seg35, seg36, seg37, seg38, seg39, seg40, seg41;
	

	
	wire [3:0] s;
	wire w0, w1, w2, w3, w10, w11;
	

   teclado_relogio U1 (lin, col, s);
	
	always @(posedge s == 12)
	begin
	    
		 w0 = 1;
		 DFlipFlop U2 (w1,w0,w2, w1);
		 
		 teclado_relogio U1 (lin, col, s);
		 wire [3:0] count;
		 reg clk;
		 
		 clock_gen (1, clk);
		 
		 always @(posedge (s == 11 || s == 10 && w10 == 0))
		 begin 
		     if (s == 10) begin w10 = 1; end
		     if (w2 == 1) begin w3 = 1; end
			  counter_mod10 U2 (w3, w10, count);
			  teclado_relogio U1 (lin, col, s);
			  
			  if (count == 1)
			  begin
			      wire [3:0] w4;
			      always @(posedge (s < 3))
					begin
					    DFlipFlop_4bits U3 (s,clk,w4);
						 sete_segmentos U4 (w4, seg0, seg1, seg2, seg3, seg4, seg5, seg6);
					end
			  end
			  if (count == 2)
			  begin
			      wire [3:0] w5;
			      always @(posedge (s < 10))
					begin
					    DFlipFlop_4bits U5 (s,clk,w5);
						 sete_segmentos U6 (w5, seg7, seg8, seg9, seg10, seg11, seg12, seg13);
					end
			  end
			  if (count == 3)
			  begin
			      wire [3:0] w6;
			      always @(posedge (s < 6))
					begin
					    DFlipFlop_4bits U7 (s,clk,w6);
						 sete_segmentos U8 (w6, seg14, seg15, seg16, seg17, seg18, seg19, seg20);
					end
			  end
			  if (count == 4)
			  begin
			      wire [3:0] w7;
			      always @(posedge (s < 10))
					begin
					    DFlipFlop_4bits U9 (s,clk,w7);
						 sete_segmentos U10 (w7, seg21, seg22, seg23, seg24, seg25, seg26, seg27);
					end
			  end
			  if (count == 5)
			  begin
			      wire [3:0] w8;
			      always @(posedge (s < 6))
					begin
					    DFlipFlop_4bits U11 (s,clk,w8);
						 sete_segmentos U12 (w8, seg28, seg29, seg30, seg31, seg32, seg33, seg34);
					end
			  end
			  if (count == 6)
			  begin
			      wire [3:0] w9;
			      always @(posedge (s < 10))
					begin
					    DFlipFlop_4bits U13 (s,clk,w9);
						 sete_segmentos U14 (w9, seg35, seg36, seg37, seg38, seg39, seg40, seg41);
					end
			  end
			  if (count == 7) begin w10 = 1; end
		 end
		 
		 
		 w11 = 0;
		 w13 = 0;
		 teclado_relogio U1 (lin, col, s);
		 always @(posedge (s == 11 || s == 10 && w11 == 0))
		 begin 
		     w12 = 0;
		     if (s == 10) begin w11 = 1; end
		     if (w10 == 1) begin w12 = 1; end
			  counter_mod10 U15 (w12, w13, count);
			  teclado_relogio U1 (lin, col, s);
			  
			  if (count == 1)
			  begin
			      wire [3:0] w20;
			      always @(posedge (s < 3))
					begin
					    DFlipFlop_4bits U16 (s,clk,w20);
						 sete_segmentos U4 (w20, seg0, seg1, seg2, seg3, seg4, seg5, seg6);
					end
			  end
			  if (count == 2)
			  begin
			      wire [3:0] w14;
			      always @(posedge (s < 10))
					begin
					    DFlipFlop_4bits U17 (s,clk,w14);
						 sete_segmentos U6 (w14, seg7, seg8, seg9, seg10, seg11, seg12, seg13);
					end
			  end
			  if (count == 3)
			  begin
			      wire [3:0] w15;
			      always @(posedge (s < 6))
					begin
					    DFlipFlop_4bits U18 (s,clk,w15);
						 sete_segmentos U8 (w15, seg14, seg15, seg16, seg17, seg18, seg19, seg20);
					end
			  end
			  if (count == 4)
			  begin
			      wire [3:0] w16;
			      always @(posedge (s < 10))
					begin
					    DFlipFlop_4bits U19 (s,clk,w16);
						 sete_segmentos U10 (w16, seg21, seg22, seg23, seg24, seg25, seg26, seg27);
					end
			  end
			  if (count == 5)
			  begin
			      wire [3:0] w17;
			      always @(posedge (s < 6))
					begin
					    DFlipFlop_4bits U20 (s,clk,w17);
						 sete_segmentos U12 (w17, seg28, seg29, seg30, seg31, seg32, seg33, seg34);
					end
			  end
			  if (count == 6)
			  begin
			      wire [3:0] w18;
			      always @(posedge (s < 10))
					begin
					    DFlipFlop_4bits U21 (s,clk,w18);
						 sete_segmentos U14 (w18, seg35, seg36, seg37, seg38, seg39, seg40, seg41);
					end
			  end
			  if (count == 7) begin w13 = 1; end
		 end
		 
		 
		 w19 = 0;
		 teclado_relogio U1 (lin, col, s);
		 always @(posedge (s == 11 || s == 10 && w11 == 0))
		 begin 
		     w12 = 0;
			  if (s == 10) begin w11 = 1; end
		     if (w13 == 1) begin w12 = 1; end
			  counter_mod10 U28 (w12, w19, count);
			  teclado_relogio U1 (lin, col, s);
			  
			  if (count == 1)
			  begin
			      wire [3:0] w21;
			      always @(posedge (s < 3))
					begin
					    DFlipFlop_4bits U22 (s,clk,w21);
						 sete_segmentos U4 (w21, seg0, seg1, seg2, seg3, seg4, seg5, seg6);
					end
			  end
			  if (count == 2)
			  begin
			      wire [3:0] w22;
			      always @(posedge (s < 10))
					begin
					    DFlipFlop_4bits U23 (s,clk,w22);
						 sete_segmentos U6 (w22, seg7, seg8, seg9, seg10, seg11, seg12, seg13);
					end
			  end
			  if (count == 3)
			  begin
			      wire [3:0] w23;
			      always @(posedge (s < 6))
					begin
					    DFlipFlop_4bits U24 (s,clk,w23);
						 sete_segmentos U8 (w23, seg14, seg15, seg16, seg17, seg18, seg19, seg20);
					end
			  end
			  if (count == 4)
			  begin
			      wire [3:0] w24;
			      always @(posedge (s < 10))
					begin
					    DFlipFlop_4bits U25 (s,clk,w24);
						 sete_segmentos U10 (w24, seg21, seg22, seg23, seg24, seg25, seg26, seg27);
					end
			  end
			  if (count == 5)
			  begin
			      wire [3:0] w25;
			      always @(posedge (s < 6))
					begin
					    DFlipFlop_4bits U26 (s,clk,w25);
						 sete_segmentos U12 (w25, seg28, seg29, seg30, seg31, seg32, seg33, seg34);
					end
			  end
			  if (count == 6)
			  begin
			      wire [3:0] w26;
			      always @(posedge (s < 10))
					begin
					    DFlipFlop_4bits U27 (s,clk,w26);
						 sete_segmentos U14 (w26, seg35, seg36, seg37, seg38, seg39, seg40, seg41);
					end
			  end
			  if (count == 7) begin w19 = 1; end
		 end
		 
		 
		 teclado_relogio U1 (lin, col, s);
		 always @(posedge (s == 11 || s == 10 && w11 == 0))
		 begin 
		     w12 = 0;
			  if (s == 10) begin w11 = 1; end
		     if (w19 == 1) begin w12 = 1; end
			  counter_mod10 U29 (w12, (w33 || w34), count);
			  teclado_relogio U1 (lin, col, s);
			  
			  if (count == 1)
			  begin
			      wire [3:0] w27;
			      always @(posedge (s < 3))
					begin
					    DFlipFlop_4bits U30 (s,clk,w27);
						 sete_segmentos U4 (w27, seg0, seg1, seg2, seg3, seg4, seg5, seg6);
					end
			  end
			  if (count == 2)
			  begin
			      wire [3:0] w28;
			      always @(posedge (s < 10))
					begin
					    DFlipFlop_4bits U31 (s,clk,w28);
						 sete_segmentos U6 (w28, seg7, seg8, seg9, seg10, seg11, seg12, seg13);
					end
			  end
			  if (count == 3)
			  begin
			      wire [3:0] w29;
			      always @(posedge (s < 6))
					begin
					    DFlipFlop_4bits U32 (s,clk,w29);
						 sete_segmentos U8 (w29, seg14, seg15, seg16, seg17, seg18, seg19, seg20);
					end
			  end
			  if (count == 4)
			  begin
			      wire [3:0] w30;
			      always @(posedge (s < 10))
					begin
					    DFlipFlop_4bits U33 (s,clk,w30);
						 sete_segmentos U10 (w30, seg21, seg22, seg23, seg24, seg25, seg26, seg27);
					end
			  end
			  if (count == 5)
			  begin
			      wire [3:0] w31;
			      always @(posedge (s < 6))
					begin
					    DFlipFlop_4bits U34 (s,clk,w31);
						 sete_segmentos U12 (w31, seg28, seg29, seg30, seg31, seg32, seg33, seg34);
					end
			  end
			  if (count == 6)
			  begin
			      wire [3:0] w32;
			      always @(posedge (s < 10))
					begin
					    DFlipFlop_4bits U35 (s,clk,w32);
						 sete_segmentos U14 (w32, seg35, seg36, seg37, seg38, seg39, seg40, seg41);
					end
			  end
			  if (count == 7) begin w11 = 1; end
		 end
		 
		 always @(posedge (s == 11 || s == 10 && w33 == w34))
		 begin
		     if (s == 11) begin w33 = 1; end
			  if (s == 12) begin w34 = 1; end
		 end
		 
		 
		 
	end
	


endmodule