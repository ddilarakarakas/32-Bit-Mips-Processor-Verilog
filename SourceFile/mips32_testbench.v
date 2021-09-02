module mips32_testbench();
	reg clock;
	wire result;	
	mips32 test(clock);
	initial clock = 0;
	initial begin 
		#500 clock=~clock; #500 clock=~clock;
		#500 clock=~clock; #500 clock=~clock;
		#500 clock=~clock; #500 clock=~clock;
		#500 clock=~clock; #500 clock=~clock;
		#500 clock=~clock; #500 clock=~clock;
		#500 clock=~clock; #500 clock=~clock;
		#500 clock=~clock; #500 clock=~clock;
		#500 clock=~clock; #500 clock=~clock;
		#500 clock=~clock; #500 clock=~clock;
		#500 clock=~clock; #500 clock=~clock;
		#500 clock=~clock; #500 clock=~clock;
		#500 clock=~clock; #500 clock=~clock;
		#500 clock=~clock; #500 clock=~clock;
		#500 clock=~clock; #500 clock=~clock;
		#500 clock=~clock; #500 clock=~clock;
		#500 clock=~clock; #500 clock=~clock;
		#500 clock=~clock; #500 clock=~clock;
	end
	initial begin
		//eq,les,upper,RegDst,Branch,Bne,MemRead,MemtoReg,ALUOp,MemWrite,ALUSrc,RegWrite,sRs,sRdD,Jump,Jal
		$monitor("time: %2d, \nPC: %32b, \ninstruction: %32b, \nOpcode= %6b , \nrs = %5b , \nrt = %5b , \nrd = %5b,	\nfunction = %6b,	\nimmediate = %16b,\nRegDst = %1b,\nbranch = %1b, \nbne = %1b, \nMem_read = %1b , \nMemToReg = %1b,\nALUop = %2b, \nMem_Write = %1b, \nALUsrc = %1b,\nReg_Write = %1b, \nsrs = %2b, \nJump = %1b, \nJal = %1b, \nReadData1 = %32b, \nReadData2 = %32b\n\n", $time, test.ProgramCounter, test.instruction, test.instruction[31:26] , test.instruction[25:21] , test.instruction[20:16], test.instruction[15:11], test.instruction[5:0], test.instruction[15:0],test.RegDst,test.Branch,test.Bne,test.MemRead,test.MemtoReg,test.ALUOp,test.MemWrite,test.ALUSrc,test.RegWrite,test.sRs,test.Jump,test.Jal,test.readData1, test.readData2);
	end
endmodule 

 