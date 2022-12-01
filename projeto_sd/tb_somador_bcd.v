module tb_somador_bcd;

    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg carry_in;

    // Outputs
    wire [3:0] soma;
    wire carry_out;

    // Instancia a unidade a ser testada
    somador_bcd uut (
        .a(a), 
        .b(b), 
        .carry_in(carry_in), 
        .soma(soma), 
        .carry_out(carry_out)
    );

    initial begin
        // Inputs de teste
        a = 0;  b = 0;  carry_in = 0;   #100;
        a = 6;  b = 9;  carry_in = 0;   #100;
        a = 3;  b = 3;  carry_in = 1;   #100;
        a = 4;  b = 5;  carry_in = 0;   #100;
        a = 8;  b = 2;  carry_in = 0;   #100;
        a = 9;  b = 9;  carry_in = 1;   #100;
    end
      
endmodule