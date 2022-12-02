module tb_randomNumber1;

	//Input
	reg clk;
	
	//Outputs
   wire [3:0] n;
	wire [2:0] Q;
	
	integer i;
	
	//Instancia a unidade a ser testada
	randomNumber1 uut (
		.clk(clk),
        .Q(Q),
        .n(n)
	);
	
	//Pulso do clock
	always begin
		clk = 1'b1; #10;
		clk = 1'b0; #10;
	end
	
	//Encerra a simulacao apos determinado tempo
	initial begin
	    #500;
	    $finish;
	end
	
endmodule