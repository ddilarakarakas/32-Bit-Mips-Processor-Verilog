module mux2to1_1bit(result, i1,i2,s0);
	output result;
	input i1,i2,s0;
	wire s0_not,and1,and2;
	not for_s0(s0_not,s0);
	and for_and1(and1,i1,s0_not);
	and for_and2(and2,i2,s0);
	or resultor(result,and1,and2);
endmodule
