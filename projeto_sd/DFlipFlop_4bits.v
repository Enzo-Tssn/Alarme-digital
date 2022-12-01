module DFlipFlop_4bits(s,clk,q);
    input [3:0] s; // Data input 
    input clk; // clock input 
    output [3:0] q; // output Q 
    
	 always @(posedge clk) 
        begin
            q <= s;	
        end 
endmodule 