module shiftLeft_2bit(outArr,inArr);
	output[31:0] outArr;
	input [31:0] inArr;
	assign outArr = {inArr[29:0], 1'b0, 1'b0};
endmodule 