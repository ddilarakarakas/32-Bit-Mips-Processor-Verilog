module RegisterMemory(ReadReg1,ReadReg2,WriteReg1,WriteReg2,WriteData1,WriteData2,ReadData1,ReadData2,RegWrite_signal,clk);
	output reg[31:0] ReadData1;
	output reg[31:0] ReadData2;
	input[4:0] ReadReg1;
	input[4:0] ReadReg2;
	input[4:0] WriteReg1;
	input[4:0] WriteReg2;
	input[31:0] WriteData1;
	input[31:0] WriteData2;
	input[1:0] RegWrite_signal;
	input clk;
	reg[31:0] registers[31:0];
	initial begin
		$readmemb("C:/altera/13.1/workspace/HW4/registers.mem", registers);
	end
	always @(posedge clk) begin
		if(RegWrite_signal[0]) begin
			registers[WriteReg1] <= WriteData1;
			$writememb("C:/altera/13.1/workspace/HW4/registers.mem",registers);
		end
		if(RegWrite_signal[1]) begin
			registers[WriteReg1] <= WriteData2;
			$writememb("C:/altera/13.1/workspace/HW4/registers.mem",registers);
		end
		ReadData1 <= registers[ReadReg1];
		ReadData2 <= registers[ReadReg2];
	end
endmodule 
		
	