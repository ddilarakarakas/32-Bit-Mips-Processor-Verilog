module mux4to1_1bit (result, i1,i2,i3,i4,s0,s1);
	output result;
	input i1,i2,i3,i4,s0,s1;
	wire s0_not, s1_not, and1, and2, and3, and4;
	not for_s0(s0_not, s0);
	not for_s1(s1_not, s1);
	and for_and1(and1,i1,s1_not,s0_not);
	and for_and2(and2,i2,s1_not,s0);
	and for_and3(and3,i3,s1,s0_not);
	and for_and4(and4,i4,s1,s0);
	or result_or(result,and1,and2,and3,and4);
endmodule
