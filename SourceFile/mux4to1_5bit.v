module mux4to1_5bit(result,i0,i1,i2,i3,s0,s1);
	output[4:0] result;
	input[4:0] i0;
	input[4:0] i1;
	input[4:0] i2;
	input[4:0] i3;
	input s0, s1;
	mux4to1_1bit mux0(result[0],i0[0],i1[0],i2[0],i3[0],s0,s1);
	mux4to1_1bit mux1(result[1],i0[1],i1[1],i2[1],i3[1],s0,s1);
	mux4to1_1bit mux2(result[2],i0[2],i1[2],i2[2],i3[2],s0,s1);
	mux4to1_1bit mux3(result[3],i0[3],i1[3],i2[3],i3[3],s0,s1);
endmodule 