module mux4to1_2bit(result, i1,i2,i3,i4,s0,s1);
	output[1:0] result;
	input[1:0] i1;
	input[1:0] i2;
	input[1:0] i3;
	input[1:0] i4;
	input s0,s1;
	mux4to1_1bit mux0(result[0],i1[0],i2[0],i3[0],i4[0],s0,s1);
	mux4to1_1bit mux1(result[1],i1[1],i2[1],i3[1],i4[1],s0,s1);
endmodule 