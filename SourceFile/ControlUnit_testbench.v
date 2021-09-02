module ControlUnit_testbench();
	wire RegDst,Branch,Bne,MemRead,MemtoReg,MemWrite,ALUSrc,Jump,Jal;
	wire[1:0] ALUop;
	reg[5:0] opcode;
	reg eq,les,upper;
	wire[1:0] RegWrite;
	wire[1:0] sRdD;
	wire[1:0] sRs;
	ControlUnit controlUnitTest(opcode,eq,les,upper,RegDst,Branch,Bne,MemRead,MemtoReg,ALUop,MemWrite,ALUSrc,RegWrite,sRs,sRdD,Jump,Jal);
	initial begin
		//lw
		opcode = 6'b100011;
		#20;
		//sw
		opcode = 6'b101011;
		#20;
		//Jump
		opcode = 6'b000010;
		#20;
		//Jal
		opcode = 6'b000011;
		#20;
		//Beq
		opcode = 6'b000100;
		#20;
		//Bne
		opcode = 6'b000101;
		#20;
		//R Type
		opcode = 6'b000000; eq = 1'b1 ; les = 1'b0; upper = 1'b0;
		#20;
		//R Type
		opcode = 6'b000000; eq = 1'b0 ; les = 1'b1; upper = 1'b0;
		#20;
		//R Type
		opcode = 6'b000000; eq = 1'b0 ; les = 1'b0; upper = 1'b1;
		#20;
	end
	initial
	begin
		$monitor("Opcode = %6b, eq = %1b, les = %1b, upper = %1b, RegDst = %1b, Branch = %1b, Bne = %1b, MemtoRead = %1b, MemtoReg = %1b, ALUop = %1b%1b, MemWrite = %1b, ALUsrc = %1b, RegWrite =%1b, sRs = %2b, sRdD = %2b , Jump = %1b, Jal = %1b",opcode,eq,les,upper,RegDst,Branch,Bne,MemRead,MemtoReg,ALUop[1],ALUop[0],MemWrite,ALUSrc,RegWrite,sRs,sRdD,Jump,Jal);
	end
endmodule

