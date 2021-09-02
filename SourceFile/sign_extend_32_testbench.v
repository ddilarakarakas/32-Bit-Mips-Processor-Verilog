module sign_extend_32_testbench();
	reg[15:0] imm;
	wire[31:0] result;
	sign_extend_32 test(result, imm);
	initial begin
		imm = 16'b1111_1011_1111_1111;
		#20;
		imm = 16'b1111_0001_0000_0001;
		#20;
		imm = 16'b0000_0000_0000_1101;
		#20;
		imm = 16'b0000_0000_0000_0000;
		#20;
	end
	initial
	begin
		$monitor("time = %2d, Immediate = %16b, Result = %32b", $time, imm, result);
	end
endmodule 