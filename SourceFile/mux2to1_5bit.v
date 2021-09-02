module mux2to1_5bit(result,i0,i1,s);
	output[4:0] result;
	input[4:0] i0;
	input[4:0] i1;
	input s;
	mux2to1_1bit m0(result[0],i0[0],i1[0],s);
	mux2to1_1bit m1(result[1],i0[1],i1[1],s);
	mux2to1_1bit m2(result[2],i0[2],i1[2],s);
	mux2to1_1bit m3(result[3],i0[3],i1[3],s);
	mux2to1_1bit m4(result[4],i0[4],i1[4],s);
endmodule