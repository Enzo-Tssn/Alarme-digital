module relogio (lin, col, bot_press, s, buzzer, bot_press,
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
	wire w0, w3, w10, w11, w12, w13, w19, w33, w34, w35, w36, w37, w38, w39, w40, w41, w42, w43, s1;
	reg w1, w2;
	

   
	reg clk, clk1;
	clock_gen (1, clk);
	clock_gen1 (1, clk1);
	
	wire maior1, menor1, igual1, maior2, menor2, igual2, maior3, menor3, igual3,
	     maior4, menor4, igual4, maior5, menor5, igual5, maior6, menor6, igual6;
		  
	reg [3:0] n1, n2, n3, n4;
	
	
	always @(posedge clk)
	begin
	    wire [3:0] count1;
	    counter_mod10 U36 (clk1, w35, count1);
		 sete_segmentos U14 (count1, seg35, seg36, seg37, seg38, seg39, seg40, seg41);
		 
		 always @(posedge count1 == 10)
		 begin
		     w35 = 1;
		     wire [3:0] count10;
		     counter_mod10 U37 (w35, w36, count10);
			  sete_segmentos U12 (count10, seg28, seg29, seg30, seg31, seg32, seg33, seg34);
			  
		     always @(posedge count10 == 6)
			  begin
			      w36 = 1;
					wire [3:0] count100;
					counter_mod10 U38 (w36, w37, count100);
					sete_segmentos U10 (count100, seg21, seg22, seg23, seg24, seg25, seg26, seg27);
					
					always @(posedge count100 == 10)
					begin
					    w37 = 1;
						 wire [3:0] count1000;
		             counter_mod10 U39 (w37, w38, count1000);
						 sete_segmentos U8 (count1000, seg14, seg15, seg16, seg17, seg18, seg19, seg20);
						 
						 always @(posedge count1000 == 6)
						 begin
						     w38 = 1;
						     wire [3:0] count10000;
		                 counter_mod10 U40 (w38, w39, count10000);
							  sete_segmentos U6 (count10000, seg7, seg8, seg9, seg10, seg11, seg12, seg13);
							  
							  always @(posedge count10000 == 6)
							  begin
							      w39 = 1;
						         wire [3:0] count100000;
		                     counter_mod10 U40 (w39, w40, count100000);
									sete_segmentos U4 (count100000, seg0, seg1, seg2, seg3, seg4, seg5, seg6);
									always @(posedge (count100000 == 2 && count10000 == 4))
									begin
									    w40 = 0;
									end
							  end
						 end
						 w38 = 0;
			      end
					w37 = 0;
			  end
			  w36 = 0;
		 end
		 w35 = 0;
		 
		 compare_4bit (igual1, maior1, menor1, count100000, w21);
		 if (igual1 == 1)
		 begin
		    compare_4bit (igual2, maior2, menor2, count10000, w22);
			 if (igual2 == 1)
		    begin
			    compare_4bit (igual3, maior3, menor3, count1000, w23);
				 if (igual3 == 1)
		       begin
			       compare_4bit (igual4, maior4, menor4, count100, w24);
					 if (igual4 == 1)
		          begin
			          compare_4bit (igual5, maior5, menor5, count10, w25);
						 if (igual5 == 1)
		             begin
			             compare_4bit (igual6, maior6, menor6, count1, w26);
							 if (igual6 == 1)
		                begin
			                if (w34 == 1)
								 begin
								    buzzer = 1;
									 always @(posedge bot_press)
			                   begin
									    teclado_relogio U1 (lin, col, s);
										 if (s == 11) begin buzzer = 0; end
									 end
								 end
								 if (w33 == 1)
								 begin
								    buzzer = 1;
									 randomNumber1 U50 (clk, n1);
									 randomNumber1 U51 (clk, n2);
									 randomNumber1 U52 (clk, n3);
									 randomNumber1 U53 (clk, n4);
									 
									 soma_compara (n1, n2, n3, n4, lin, col, bot_press, s1,
                                          seg0, seg1, seg2, seg3, seg4, seg5, seg6, seg7, seg8, seg9, seg10, seg11, seg12, seg13,
	                                       seg28, seg29, seg30, seg31, seg32, seg33, seg34, seg35, seg36, seg37, seg38, seg39, seg40, seg41);
									 
									 if (s1 == 1) begin buzzer = 0; end
								 end
			             end
			          end
			       end
			    end
			 end
		 end
		 
		 compare_4bit (igual1, maior1, menor1, count100000, w27);
		 if (igual1 == 1)
		 begin
		    compare_4bit (igual2, maior2, menor2, count10000, w28);
			 if (igual2 == 1)
		    begin
			    compare_4bit (igual3, maior3, menor3, count1000, w29);
				 if (igual3 == 1)
		       begin
			       compare_4bit (igual4, maior4, menor4, count100, w30);
					 if (igual4 == 1)
		          begin
			          compare_4bit (igual5, maior5, menor5, count10, w31);
						 if (igual5 == 1)
		             begin
			             compare_4bit (igual6, maior6, menor6, count1, w32);
							 if (igual6 == 1)
		                begin
			                if (w34 == 1)
								 begin
								    buzzer = 1;
									 always @(posedge bot_press)
			                   begin
									    teclado_relogio U1 (lin, col, s);
										 if (s == 11) begin buzzer = 0; end
									 end
								 end
								 if (w33 == 1)
								 begin
								    buzzer = 1;
									 randomNumber1 U50 (clk, n1);
									 randomNumber1 U51 (clk, n2);
									 randomNumber1 U52 (clk, n3);
									 randomNumber1 U53 (clk, n4);
									 
									 soma_compara (n1, n2, n3, n4, lin, col, bot_press, s1,
                                          seg0, seg1, seg2, seg3, seg4, seg5, seg6, seg7, seg8, seg9, seg10, seg11, seg12, seg13,
	                                       seg28, seg29, seg30, seg31, seg32, seg33, seg34, seg35, seg36, seg37, seg38, seg39, seg40, seg41);
									 
									 if (s1 == 1) begin buzzer = 0; end
								 end
			             end
			          end
			       end
			    end
			 end
		 end
		 
		 compare_4bit (igual1, maior1, menor1, count100000, w20);
		 if (igual1 == 1)
		 begin
		    compare_4bit (igual2, maior2, menor2, count10000, w14);
			 if (igual2 == 1)
		    begin
			    compare_4bit (igual3, maior3, menor3, count1000, w15);
				 if (igual3 == 1)
		       begin
			       compare_4bit (igual4, maior4, menor4, count100, w16);
					 if (igual4 == 1)
		          begin
			          compare_4bit (igual5, maior5, menor5, count10, w17);
						 if (igual5 == 1)
		             begin
			             compare_4bit (igual6, maior6, menor6, count1, w18);
							 if (igual6 == 1)
		                begin
			                if (w34 == 1)
								 begin
								    buzzer = 1;
									 always @(posedge bot_press)
			                   begin
									    teclado_relogio U1 (lin, col, s);
										 if (s == 11) begin buzzer = 0; end
									 end
								 end
								 if (w33 == 1)
								 begin
								    buzzer = 1;
									 randomNumber1 U50 (clk, n1);
									 randomNumber1 U51 (clk, n2);
									 randomNumber1 U52 (clk, n3);
									 randomNumber1 U53 (clk, n4);
									 
									 soma_compara (n1, n2, n3, n4, lin, col, bot_press, s1,
                                          seg0, seg1, seg2, seg3, seg4, seg5, seg6, seg7, seg8, seg9, seg10, seg11, seg12, seg13,
	                                       seg28, seg29, seg30, seg31, seg32, seg33, seg34, seg35, seg36, seg37, seg38, seg39, seg40, seg41);
									 
									 if (s1 == 1) begin buzzer = 0; end
								 end
			             end
			          end
			       end
			    end
			 end
		 end
		  
	end
	
	always @(posedge bot_press)
	begin
	    teclado_relogio U1 (lin, col, s);
	    if (s == 12)
		 begin
		    w0 = 1;
		    DFlipFlop U2 (w1,w0,w2, w1);
		    teclado_relogio U1 (lin, col, s);
			 wire [3:0] count;
		 
		    always @(posedge bot_press)
			 begin
			    if (s == 11 || s == 10 && w10 == 0)
				 begin
				    if (s == 10) begin w10 = 1; end
				    if (w2 == 1) begin w3 = 1; end
				    counter_mod10 U2 (w3, w10, count);
					 
					 if (count == 1)
				    begin
						reg [3:0] w4;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 3)
							begin
							   DFlipFlop_4bits U3 (s,clk,w4);
							   sete_segmentos U4 (w4, seg0, seg1, seg2, seg3, seg4, seg5, seg6);
							end
					   end
				    end
					 
					 if (count == 2)
				    begin
						reg [3:0] w5;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 10)
							begin
							   DFlipFlop_4bits U5 (s,clk,w5);
							   sete_segmentos U6 (w5, seg7, seg8, seg9, seg10, seg11, seg12, seg13);
							end
					   end
				    end
					 
					 if (count == 3)
				    begin
						reg [3:0] w6;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 6)
							begin
							   DFlipFlop_4bits U7 (s,clk,w6);
							   sete_segmentos U8 (w6, seg14, seg15, seg16, seg17, seg18, seg19, seg20);
							end
					   end
				    end
					 
					 if (count == 4)
				    begin
						reg [3:0] w7;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 10)
							begin
							   DFlipFlop_4bits U9 (s,clk,w7);
							   sete_segmentos U10 (w7, seg21, seg22, seg23, seg24, seg25, seg26, seg27);
							end
					   end
				    end
					 
					 if (count == 5)
				    begin
						reg [3:0] w8;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 6)
							begin
							   DFlipFlop_4bits U11 (s,clk,w8);
							   sete_segmentos U12 (w8, seg28, seg29, seg30, seg31, seg32, seg33, seg34);
							end
					   end
				    end
					 
					 if (count == 6)
				    begin
						reg [3:0] w9;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 10)
							begin
							   DFlipFlop_4bits U13 (s,clk,w9);
							   sete_segmentos U14 (w9, seg35, seg36, seg37, seg38, seg39, seg40, seg41);
							end
					   end
				    end
					 
					 if (count == 7) begin w10 = 1; end
	 
				 end
		       w3 = 0;		 
			 end
			 w11 = 0;
			 w13 = 0;
			 
			 wire [3:0] count2;
			 always @(posedge bot_press)
			 begin
			    teclado_relogio U1 (lin, col, s);
			    if (s == 11 || s == 10 && w11 == 0 && w13 == 0)
				 begin
				    if (s == 10) begin w11 = 1; end
				    if (w2 == 1) begin w12 = 1; end
				    counter_mod10 U15 (w12, w13, count2);
					 
					 if (count2 == 1)
				    begin
						reg [3:0] w20;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 3)
							begin
							   DFlipFlop_4bits U16 (s,clk,w20);
							   sete_segmentos U4 (w20, seg0, seg1, seg2, seg3, seg4, seg5, seg6);
							end
					   end
				    end
					 
					 if (count2 == 2)
				    begin
						reg [3:0] w14;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 10)
							begin
							   DFlipFlop_4bits U17 (s,clk,w14);
							   sete_segmentos U6 (w14, seg7, seg8, seg9, seg10, seg11, seg12, seg13);
							end
					   end
				    end				 
					 
					 if (count2 == 3)
				    begin
						reg [3:0] w15;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 6)
							begin
							   DFlipFlop_4bits U18 (s,clk,w15);
							   sete_segmentos U8 (w15, seg14, seg15, seg16, seg17, seg18, seg19, seg20);
							end
					   end
				    end					 
					 
					 if (count2 == 4)
				    begin
						reg [3:0] w16;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 10)
							begin
							   DFlipFlop_4bits U19 (s,clk,w16);
							   sete_segmentos U10 (w16, seg21, seg22, seg23, seg24, seg25, seg26, seg27);
							end
					   end
				    end			 
					 
					 if (count2 == 5)
				    begin
						reg [3:0] w17;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 6)
							begin
							   DFlipFlop_4bits U20 (s,clk,w17);
							   sete_segmentos U12 (w17, seg28, seg29, seg30, seg31, seg32, seg33, seg34);
							end
					   end
				    end		 
					 
					 if (count2 == 6)
				    begin
						reg [3:0] w18;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 10)
							begin
							   DFlipFlop_4bits U13 (s,clk,w18);
							   sete_segmentos U14 (w18, seg35, seg36, seg37, seg38, seg39, seg40, seg41);
							end
					   end
				    end
					 			 
					 if (count2 == 7) begin w13 = 1; end
		 
				 end
		       w12 = 0;		 
			 end
				  
			 
			 wire [3:0] count3;
			 w19 = 0;
			 always @(posedge bot_press)
			 begin
			    teclado_relogio U1 (lin, col, s);
			    if (s == 11 || s == 10 && w11 == 0 && w19 == 0)
				 begin
				    if (s == 10) begin w11 = 1; end
				    if (w13 == 1) begin w41 = 1; end
				    counter_mod10 U28 (w41, w19, count3);
					 
					 if (count3 == 1)
				    begin
						reg [3:0] w21;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 3)
							begin
							   DFlipFlop_4bits U22 (s,clk,w21);
							   sete_segmentos U4 (w21, seg0, seg1, seg2, seg3, seg4, seg5, seg6);
							end
					   end
				    end
					 
					 if (count3 == 2)
				    begin
						reg [3:0] w22;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 10)
							begin
							   DFlipFlop_4bits U23 (s,clk,w22);
							   sete_segmentos U6 (w22, seg7, seg8, seg9, seg10, seg11, seg12, seg13);
							end
					   end
				    end
					 
					 if (count3 == 3)
				    begin
						reg [3:0] w23;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 6)
							begin
							   DFlipFlop_4bits U24 (s,clk,w23);
							   sete_segmentos U8 (w23, seg14, seg15, seg16, seg17, seg18, seg19, seg20);
							end
					   end
				    end		
					 
					 if (count3 == 4)
				    begin
						reg [3:0] w24;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 10)
							begin
							   DFlipFlop_4bits U25 (s,clk,w24);
							   sete_segmentos U10 (w24, seg21, seg22, seg23, seg24, seg25, seg26, seg27);
							end
					   end
				    end			 
					 
					 if (count3 == 5)
				    begin
						reg [3:0] w25;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 6)
							begin
							   DFlipFlop_4bits U26 (s,clk,w25);
							   sete_segmentos U12 (w25, seg28, seg29, seg30, seg31, seg32, seg33, seg34);
							end
					   end
				    end
					 
					 if (count3 == 6)
				    begin
						reg [3:0] w26;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 10)
							begin
							   DFlipFlop_4bits U27 (s,clk,w26);
							   sete_segmentos U14 (w26, seg35, seg36, seg37, seg38, seg39, seg40, seg41);
							end
					   end
				    end
					 	 			 
					 if (count3 == 7) begin w19 = 1; end
		 
				 end
		       w41 = 0;		 
			 end
			 
			 wire [3:0] count4;
			 w42 = 0;
			 always @(posedge bot_press)
			 begin
			    teclado_relogio U1 (lin, col, s);
			    if (s == 11 || s == 10 && w11 == 0)
				 begin
				    if (s == 10) begin w11 = 1; end
				    if (w19 == 1) begin w42 = 1; end
				    counter_mod10 U29 (w42, (w33 || w34), count4);
					 
					 if (count4 == 1)
				    begin
						reg [3:0] w27;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 3)
							begin
							   DFlipFlop_4bits U30 (s,clk,w27);
							   sete_segmentos U4 (w27, seg0, seg1, seg2, seg3, seg4, seg5, seg6);
							end
					   end
				    end
					 
					 if (count4 == 2)
				    begin
						reg [3:0] w28;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 10)
							begin
							   DFlipFlop_4bits U31 (s,clk,w28);
							   sete_segmentos U6 (w28, seg7, seg8, seg9, seg10, seg11, seg12, seg13);
							end
					   end
				    end

					 if (count4 == 3)
				    begin
						reg [3:0] w29;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 6)
							begin
							   DFlipFlop_4bits U32 (s,clk,w29);
							   sete_segmentos U8 (w29, seg14, seg15, seg16, seg17, seg18, seg19, seg20);
							end
					   end
				    end	
					 
					 if (count4 == 4)
				    begin
						reg [3:0] w30;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 10)
							begin
							   DFlipFlop_4bits U33 (s,clk,w30);
							   sete_segmentos U10 (w30, seg21, seg22, seg23, seg24, seg25, seg26, seg27);
							end
					   end
				    end				
					 
					 if (count4 == 5)
				    begin
						reg [3:0] w31;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 6)
							begin
							   DFlipFlop_4bits U34 (s,clk,w31);
							   sete_segmentos U12 (w31, seg28, seg29, seg30, seg31, seg32, seg33, seg34);
							end
					   end
				    end
					 
					 if (count4 == 6)
				    begin
						reg [3:0] w32;
						always @(posedge bot_press)
					   begin
					      teclado_relogio U1 (lin, col, s);
							if (s < 10)
							begin
							   DFlipFlop_4bits U35 (s,clk,w32);
							   sete_segmentos U14 (w32, seg35, seg36, seg37, seg38, seg39, seg40, seg41);
							end
					   end
				    end
					 	 			 
					 if (count4 == 7) begin w11 = 1; end
		 
				 end
		       w41 = 0;		 
			 end
			 
			 always @(posedge bot_press)
			 begin
			    teclado_relogio U1 (lin, col, s);
			    if (s == 11 || s == 10 && w33 == w34)
				 begin
				    if (s == 11) begin w33 = 1; end
				    if (s == 10) begin w34 = 1; end
				 end
			 end	 	 	 
		 end
	end
	

endmodule