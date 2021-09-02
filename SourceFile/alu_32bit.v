module alu_32bit(result,ifBeq,Ai,Bi,op2,op1,op0);
	output[31:0] result;
	output ifBeq;
	input[31:0] Ai;
	input[31:0] Bi;
	input op2, op1, op0;
	
	wire[31:0] carryOut;
	
	alu_1bit bit0(result[0],carryOut[0],op2,Ai[0],Bi[0],op2,op1,op0),
				bit1(result[1],carryOut[1],carryOut[0],Ai[1],Bi[1],op2,op1,op0),
				bit2(result[2],carryOut[2],carryOut[1],Ai[2],Bi[2],op2,op1,op0),
				bit3(result[3],carryOut[3],carryOut[2],Ai[3],Bi[3],op2,op1,op0),
				bit4(result[4],carryOut[4],carryOut[3],Ai[4],Bi[4],op2,op1,op0),
				bit5(result[5],carryOut[5],carryOut[4],Ai[5],Bi[5],op2,op1,op0),
				bit6(result[6],carryOut[6],carryOut[5],Ai[6],Bi[6],op2,op1,op0),
				bit7(result[7],carryOut[7],carryOut[6],Ai[7],Bi[7],op2,op1,op0),
				bit8(result[8],carryOut[8],carryOut[7],Ai[8],Bi[8],op2,op1,op0),
				bit9(result[9],carryOut[9],carryOut[8],Ai[9],Bi[9],op2,op1,op0),
				bit10(result[10],carryOut[10],carryOut[9],Ai[10],Bi[10],op2,op1,op0),
				bit11(result[11],carryOut[11],carryOut[10],Ai[11],Bi[11],op2,op1,op0),
				bit12(result[12],carryOut[12],carryOut[11],Ai[12],Bi[12],op2,op1,op0),
				bit13(result[13],carryOut[13],carryOut[12],Ai[13],Bi[13],op2,op1,op0),
				bit14(result[14],carryOut[14],carryOut[13],Ai[14],Bi[14],op2,op1,op0),
				bit15(result[15],carryOut[15],carryOut[14],Ai[15],Bi[15],op2,op1,op0),	
				bit16(result[16],carryOut[16],carryOut[15],Ai[16],Bi[16],op2,op1,op0),
				bit17(result[17],carryOut[17],carryOut[16],Ai[17],Bi[17],op2,op1,op0),
				bit18(result[18],carryOut[18],carryOut[17],Ai[18],Bi[18],op2,op1,op0),
				bit19(result[19],carryOut[19],carryOut[18],Ai[19],Bi[19],op2,op1,op0),
				bit20(result[20],carryOut[20],carryOut[19],Ai[20],Bi[20],op2,op1,op0),	
				bit21(result[21],carryOut[21],carryOut[20],Ai[21],Bi[21],op2,op1,op0),
				bit22(result[22],carryOut[22],carryOut[21],Ai[22],Bi[22],op2,op1,op0),
				bit23(result[23],carryOut[23],carryOut[22],Ai[23],Bi[23],op2,op1,op0),
				bit24(result[24],carryOut[24],carryOut[23],Ai[24],Bi[24],op2,op1,op0),
				bit25(result[25],carryOut[25],carryOut[24],Ai[25],Bi[25],op2,op1,op0),
				bit26(result[26],carryOut[26],carryOut[25],Ai[26],Bi[26],op2,op1,op0),
				bit27(result[27],carryOut[27],carryOut[26],Ai[27],Bi[27],op2,op1,op0),
				bit28(result[28],carryOut[28],carryOut[27],Ai[28],Bi[28],op2,op1,op0),
				bit29(result[29],carryOut[29],carryOut[28],Ai[29],Bi[29],op2,op1,op0),
				bit30(result[30],carryOut[30],carryOut[29],Ai[30],Bi[30],op2,op1,op0),
				bit31(result[31],carryOut[31],carryOut[30],Ai[31],Bi[31],op2,op1,op0);

	//zero bit 
	wire zero_bit;
	or calc_zeroBit(zero_bit,result[0],result[1],result[2],result[3],result[4],result[5],result[6],result[7]
									,result[8],result[9],result[10],result[11],result[12],result[13],result[14],result[15]
									,result[16],result[17],result[18],result[19],result[20],result[21],result[22],result[23]
									,result[24],result[25],result[26],result[27],result[28],result[29],result[30],result[31]);
	not(ifBeq,zero_bit);
endmodule
