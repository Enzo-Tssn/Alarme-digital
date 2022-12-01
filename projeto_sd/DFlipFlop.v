module DFlipFlop(d,clk,q, q1);
    input d; // Data input 
    input clk; // clock input 
    output q, q1; // output Q 
    
	 always @(posedge clk) 
        begin
            q <= d;
			   q1 = ~q;	
        end 
endmodule 