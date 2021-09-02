module comparator_32bit(number,eq,less,upper);
	input[31:0] number;
	output eq,less,upper;
	wire tempZero;
	or(tempZero,number[30],number[29],number[28],number[27],number[26],number[25],
					number[24],number[23],number[22],number[21],number[20],number[19],
					number[18],number[17],number[16],number[15],number[14],number[13],
					number[12],number[11],number[10],number[9],number[8],number[7],
					number[6],number[5],number[4],number[3],number[2],number[1],number[0]);
	//less
	wire tempLess1;
	and(tempLess1,tempZero,number[31]);
	wire not_tempZero;
	not(not_tempZero,tempZero);
	wire tempLess2;
	and(tempLess2,number[31],not_tempZero);
	or(less,tempLess1,tempLess2);
	//Equal
	wire not_31;
	not(not_31,number[31]);
	and(eq,not_31,not_tempZero);
	//Upper
	and(upper,not_31,tempZero);
endmodule 