module somador_bcd (a, b, carry_in, soma, carry_out);

    input [3:0] a,b;
    input carry_in;
    output [3:0] soma;
    output carry_out;
    
    reg [4:0] soma_aux;
    reg [3:0] soma;
    reg carry_out;  

    always @(a,b,carry_in)
    begin
        soma_aux = a+b+carry_in; //adiciona todos os inputs
        if(soma_aux > 9)
				begin
					soma_aux = soma_aux+6; //adiciona 6 se o resultado for maior que 9
					carry_out = 1;  
					soma = soma_aux[3:0];
				end
        else    
				begin
					carry_out = 0;
					soma = soma_aux[3:0];
				end
    end     

endmodule