module RegisterMemory_testbench();
	reg[4:0] ReadReg1, ReadReg2, WriteReg1,WriteReg2;
	reg[31:0] WriteData1,WriteData2;
	reg[1:0] RegWrite_signal;
	reg clk;
	wire [31:0] ReadData1, ReadData2;
	RegisterMemory TestRegister(ReadReg1,ReadReg2,WriteReg1,WriteReg2,WriteData1,WriteData2,ReadData1,ReadData2,RegWrite_signal,clk);
	initial clk = 1;
	always
		#40 clk=~clk;
	initial begin
		#321 $finish;
	end
	initial begin
		ReadReg1 = 5'd2 ; ReadReg2 = 5'd6 ; WriteReg1 = 5'd10 ; WriteData1 = 32'd14; WriteReg2 = 5'd10 ; WriteData2 = 32'd14; RegWrite_signal = 2'b10 ; 
		#180;
		ReadReg1 = 5'd3 ; ReadReg2 = 5'd7 ; WriteReg1 = 5'd11 ; WriteData1 = 32'd14; WriteReg2 = 5'd10 ; WriteData2 = 32'd14; RegWrite_signal = 2'b11 ; 
		#180;
		ReadReg1 = 5'd4 ; ReadReg2 = 5'd8 ; WriteReg1 = 5'd12 ; WriteData1 = 32'd14; WriteReg2 = 5'd10 ; WriteData2 = 32'd14; RegWrite_signal = 2'b10 ; 
		#180;
		ReadReg1 = 5'd5 ; ReadReg2 = 5'd9 ; WriteReg1 = 5'd13 ; WriteData1 = 32'd14; WriteReg2 = 5'd10 ; WriteData2 = 32'd14; RegWrite_signal = 2'b11 ; 
		#180;
	end
	initial begin
		$monitor("time = %2d,\nReadReg1 = %5b, \nReadReg2 = %32b \nReadData1 = %5b, \nReadData2 = %32b \nWriteReg1 = %5b, \nWriteReg2 = %5b, \nWriteData1 = %32b,\nWriteData2 = %32b, \nRegWrite_signal = %2b \n\n ", $time, ReadReg1,ReadReg2,WriteReg1,WriteReg2,WriteData1,WriteData2,ReadData1,ReadData2,RegWrite_signal);
	end
endmodule
