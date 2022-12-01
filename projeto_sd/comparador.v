module comparador (a, b, s);
	input [11:0] a, b;
	output s;
	
	wire x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11;
	
	xnor xnor0 (x0, a[0], b[0]);
	xnor xnor1 (x1, a[1], b[1]);
	xnor xnor2 (x2, a[2], b[2]);
	xnor xnor3 (x3, a[3], b[3]);
	xnor xnor4 (x4, a[4], b[4]);
	xnor xnor5 (x5, a[5], b[5]);
	xnor xnor6 (x6, a[6], b[6]);
	xnor xnor7 (x7, a[7], b[7]);
	xnor xnor8 (x8, a[8], b[8]);
	xnor xnor9 (x9, a[9], b[9]);
	xnor xnor10 (x10, a[10], b[10]);
	xnor xnor11 (x11, a[11], b[11]);
	and and0 (s, x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11);
	
endmodule