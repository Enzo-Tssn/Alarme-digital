module compare_1bit (ig, ma, me, A, B, HAB);
    input A, B, HAB;
    output ig, ma, me;
    
    assign ig = HAB & (A~^B);
    assign ma = HAB & (A&(~B));
    assign me = HAB & (~(A)&B);
endmodule