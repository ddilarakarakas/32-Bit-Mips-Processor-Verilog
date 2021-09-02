module ControlUnit(opcode,eq,les,upper,RegDst,Branch,Bne,MemRead,MemtoReg,ALUOp,MemWrite,ALUSrc,RegWrite,sRs,sRdD,Jump,Jal);
	input[5:0] opcode;
	input eq,les,upper;
	output RegDst,Branch,Bne,MemRead,MemtoReg,MemWrite,ALUSrc,Jump,Jal;
	output[1:0] ALUOp;
	output[1:0] RegWrite;
	output[1:0] sRdD;
	output[1:0] sRs;
	wire not_op5;
	wire not_op4;
	wire not_op3;
	wire not_op2;
	wire not_op1;
	wire not_op0;
	not(not_op5,opcode[5]);
	not(not_op4,opcode[4]);
	not(not_op3,opcode[3]);
	not(not_op2,opcode[2]);
	not(not_op1,opcode[1]);
	not(not_op0,opcode[0]);
	// output RegDst
	and(RegDst,not_op0,not_op1,not_op2,not_op3,not_op4,not_op5);
	//ouput branch
	and(Branch,not_op5,not_op4,not_op3,opcode[2],not_op1,not_op0);
	//output bne
	and(Bne,not_op5,not_op4,not_op3,opcode[2],not_op1,opcode[0]);
	//output memRead
	and(MemRead,opcode[5],not_op4,not_op3,not_op2,opcode[1],opcode[0]);
	//output MemtoReg
	and(MemtoReg,opcode[5],not_op4,not_op3,not_op2,opcode[1],opcode[0]);
	//ALUOp[1]
	and(ALUOp[1],not_op0,not_op1,not_op2,not_op3,not_op4,not_op5);
	//ALUOp[0]
	wire tempALU0;
	and(tempALU0,not_op5,not_op4,not_op3,opcode[2],not_op1,opcode[0]);
	wire tempALU1;
	and(tempALU1,not_op5,not_op4,not_op3,opcode[2],not_op1,not_op0);
	or(ALUOp[0],tempALU0,tempALU1);
	//MemWrite
	and(MemWrite,opcode[5],not_op4,opcode[3],not_op2,opcode[1],opcode[0]);
	//ALUSrc
	wire tempSrc1;
	and(tempSrc1,opcode[5],not_op4,opcode[3],not_op2,opcode[1],opcode[0]);
	wire tempSrc2;
	and(tempSrc2,opcode[5],not_op4,not_op3,not_op2,opcode[1],opcode[0]);
	or(ALUSrc,tempSrc1,tempSrc2);
	//RegWrite[0]
	wire tempLW;
	and(tempLW,opcode[5],not_op4,not_op3,not_op2,opcode[1],opcode[0]);
	wire tempJal;
	and(tempJal,not_op5,not_op4,not_op3,not_op2,opcode[1],opcode[0]);
	wire tempRType;
	and(tempRType,not_op0,not_op1,not_op2,not_op3,not_op4,not_op5);
	or(RegWrite[0],tempJal,tempLW,tempRType);
	//ReWrite[1]
	and(RegWrite[1],not_op0,not_op1,not_op2,not_op3,not_op4,not_op5);
	//sRs[1]
	and(sRs[1],not_op0,not_op1,not_op2,not_op3,not_op4,not_op5);
	//sRs[0]
	wire tempsRs;
	and(tempsRs,not_op0,not_op1,not_op2,not_op3,not_op4,not_op5);
	wire tempsRs1;
	and(tempsRs1,not_op5,not_op4,not_op3,not_op2,opcode[1],opcode[0]);
	or(sRs[0],tempsRs,tempsRs1);
	//sRdD (eq -> 1, les -> 2, upper -> 3) (00 -> 1, 01 -> 2, 10 -> 3)
	//sRdD[0]
	and(sRdD[0],not_op0,not_op1,not_op2,not_op3,not_op4,not_op5,les);
	//sRdD[1]
	and(sRdD[1],not_op0,not_op1,not_op2,not_op3,not_op4,not_op5,upper);	
	//jump
	and(Jump,not_op5,not_op4,not_op3,not_op2,opcode[1],not_op0);
	//jal
	and(Jal,not_op5,not_op4,not_op3,not_op2,opcode[1],opcode[0]);
endmodule 