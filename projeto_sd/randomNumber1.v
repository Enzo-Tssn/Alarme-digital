module randomNumber1(clk, n, Q);
    input clk;
    output reg [3:0] n;
    reg c;
    
    output reg [2:0] Q;
    
    always @(posedge clk)
    begin
        Q <= {Q[0] ~^ Q[2], Q[1], Q[2]};
        n = {~(Q[0] | Q[1]), ~Q[0], ~Q[1], ~Q[2]};
    end
    
endmodule
	