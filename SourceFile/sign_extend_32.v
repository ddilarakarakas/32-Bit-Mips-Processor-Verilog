module sign_extend_32(outputarr,immediate);
	output[31:0] outputarr;
	input [15:0] immediate;
	or or0( outputarr[31],0,immediate[15]);
	or or1( outputarr[30],0,immediate[15]);
	or or2( outputarr[29],0,immediate[15]);
	or or3( outputarr[28],0,immediate[15]);
	or or4( outputarr[27],0,immediate[15]);
	or or5( outputarr[26],0,immediate[15]);
	or or6( outputarr[25],0,immediate[15]);
	or or7( outputarr[24],0,immediate[15]);
	or or8( outputarr[23],0,immediate[15]);
	or or9( outputarr[22],0,immediate[15]);
	or or10(outputarr[21],0,immediate[15]);
	or or11(outputarr[20],0,immediate[15]);
	or or12(outputarr[19],0,immediate[15]);
	or or13(outputarr[18],0,immediate[15]);
	or or14(outputarr[17],0,immediate[15]);
	or or15(outputarr[16],0,immediate[15]);
	or or16(outputarr[15],0,immediate[15]);
	or or17(outputarr[14],0,immediate[14]);
	or or18(outputarr[13],0,immediate[13]);
	or or19(outputarr[12],0,immediate[12]);
	or or20(outputarr[11],0,immediate[11]);
	or or21(outputarr[10],0,immediate[10]);
	or or22(outputarr[9],0, immediate[9]);
	or or23(outputarr[8],0, immediate[8]);
	or or24(outputarr[7],0, immediate[7]);
	or or25(outputarr[6],0, immediate[6]);
	or or26(outputarr[5],0, immediate[5]);
	or or27(outputarr[4],0, immediate[4]);
	or or28(outputarr[3],0, immediate[3]);
	or or29(outputarr[2],0, immediate[2]);
	or or30(outputarr[1],0, immediate[1]);
	or or31(outputarr[0],0, immediate[0]);
endmodule 