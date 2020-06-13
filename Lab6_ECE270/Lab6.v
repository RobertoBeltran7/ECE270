module Lab6(I,D,G,P,Fa,Fb,Ff);
	input I, D, G, P /* synthesis loc="2,3,4,5" */;
	output Fa /* synthesis loc="14" */;
	output Fb /* synthesis loc="16" */;
	output Ff /* synthesis loc="18" */;
	
	assign Fa = I & (D & G | D & P | G & P);
	assign Fb = (~I) & (D | G | P);
	assign Ff = ~(Fa | Fb);

endmodule

