module ALUControl(functionField,ALUop,op2,op1,op0);
	input[5:0] functionField;
	input[1:0] ALUop;
	output op2,op1,op0;
	wire not_f5;
	wire not_f4;
	wire not_f3;
	wire not_f2;
	wire not_f1;
	wire not_f0;
	wire not_ALUop1;
	wire not_ALUop0;
	not(not_f5,functionField[5]);
	not(not_f4,functionField[4]);
	not(not_f3,functionField[3]);
	not(not_f2,functionField[2]);
	not(not_f1,functionField[1]);
	not(not_f0,functionField[0]);
	not(not_ALUop1,ALUop[1]);
	not(not_ALUop0,ALUop[0]);
	//aluop1 & aluop0' f5 & f4'& f3' & f2' f1
	wire and2;
	and(and2,ALUop[1],not_ALUop0,functionField[5],not_f4,not_f3,not_f2,functionField[1],not_f0);
	//aluop1' & aluop0
	wire and2_1;
	and(and2_1,not_ALUop1,ALUop[0]);
	//op2
	or(op2,and2,and2_1);
	// aluop1 & aluop0' & (f2' + (f2&f1))
	wire temp;
	and(temp,functionField[2],functionField[1]);
	wire temp2;
	or(temp2,temp,not_f2);
	wire and1;
	and(and1,temp2,ALUop[1],not_ALUop0);
	// op1 = and1 | aluop1'
	or(op1,and1,not_ALUop1);
	//aluop1 & aluop0' = temp3
	wire temp3;
	and(temp3,ALUop[1],not_ALUop0);
	//temp3 & f5 & f4' & f3' & f2 (f1 xor f0) = op0
	wire xor_;
	xor(xor_,functionField[1],functionField[0]);
	//wire and0;
	and(op0,temp3,functionField[5],not_f4,not_f3,functionField[2],xor_);
	// op0 = temp3 | and0
	//or(op0,temp3,and0);
endmodule 
	
	
	
	
	
	