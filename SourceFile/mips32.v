module mips32(clk);
	input clk;
	//program counter tanımlama
	reg[31:0] ProgramCounter = 32'b0;
	wire[31:0] instruction, address, TempAddress;
	wire ALUResult;
	// instructions reader
	InstructionMemory read_inst (instruction,ProgramCounter);
	//sinyaller
	wire eq,les,upper;
	wire RegDst,Branch,Bne,MemRead,MemtoReg,MemWrite,ALUSrc,Jump,Jal;
	wire[1:0] ALUOp;
	wire[1:0] RegWrite;
	wire[1:0] sRdD;
	wire[1:0] sRs;
	//control unit çağrılması
	ControlUnit controlUnit(instruction[31:26],eq,les,upper,RegDst,Branch,Bne,MemRead,MemtoReg,ALUOp,MemWrite,ALUSrc,RegWrite,sRs,sRdD,Jump,Jal);
	//register için rt ve rs mux u
	wire[4:0] resultMux2to1_5bit;
	mux2to1_5bit mux2to1_5(resultMux2to1_5bit,instruction[20:16],instruction[15:11],RegDst);
	//register için 2. mux
	wire temp[4:0];
	wire[4:0] resultWriteReg1;
	wire[4:0] reg31 = 5'b11111;
	mux4to1_5bit _2mux(resultWriteReg1,reg31,instruction[25:21],sRs[0],sRs[1]);
	//write data1 için seçim
	wire[31:0] writeData1;
	wire[31:0] tempPC = ProgramCounter + 1;
	mux2to1_32bit writeMux(writeData1,TempAddress,tempPC,Jal);
	//write data2 için seçim ve oluşması
	comparator_32bit com(ALUResult,eq,les,upper);
	wire[31:0] writeData2;
	reg[31:0] one = 32'b1;
	reg[31:0] two = 32'b10;
	reg[31:0] three = 32'b11;
	mux4to1_32bit muxWritedata2(writeData2,one,two,three,sRdD[0],sRdD[1]);
	//register çağrılması RegisterMemory(ReadReg1,ReadReg2,WriteReg1,WriteReg2,WriteData1,WriteData2,ReadData1,ReadData2,RegWrite_signal,clk)
	wire[31:0] readData1, readData2;
	RegisterMemory registerMemory(instruction[25:21],instruction[20:16],resultWriteReg,instruction[15:11],writeData1,writeData2,readData1,readData2,RegWrite,clk);
	//signExtend
	wire[31:0] signdExtend32;
	sign_extend_32 sign(signExtend32,instruction[15:0]);
	//alu için mux 
	wire[31:0] aluNumberMux;
	mux2to1_32bit alumux(aluNumberMux,readData2,signExtend32,ALUSrc);
	//ALU çağrımı için ALU Control
	wire op2,op1,op0;
	ALUControl aluControl(instruction[5:0],ALUOp,op2,op1,op0);
	//ALU çağrılması
	wire zero;
	alu_32bit alu(address,zero,readData1,aluNumberMux,op2,op1,op0);
	// Memory(address,writeData,MemWrite_signal,MemRead_signal,readData,clk)
	wire[31:0] memoryReadData;
	Memory mem(address,readData2,MemWrite,MemRead,memoryReadData,clk);
	//tempAddress seçimi
	mux2to1_32bit tempAddressmux(tempAddress,address,memoryReadData,MemtoReg);
	//Branch olup olmadığını anlamak için signal üretme
	wire branchMuxSignal;
	and andBranch(branchMuxSignal,Branch,zero);
	// Program_Counter veya branch islemleri icin ...
	always @(posedge clk) begin 
			if(instruction[31:26] == 6'h2 || instruction[31:26] == 6'h3) begin // jump or jal
				ProgramCounter = address;
			end
			else if(writeData1 == 0 & Branch == 1) begin // branch
				ProgramCounter = ProgramCounter + 1 + $signed(instruction[15:0]); 
			end
			else begin
				ProgramCounter = ProgramCounter + 1;
			end
	end 
endmodule
	
	
	
	