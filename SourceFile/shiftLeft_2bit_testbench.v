module shiftLeft_2bit_testbench();
	reg [31:0] in;
	wire [31:0] out;
	shiftLeft_2bit test(out,in);
	initial begin
		in = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
		#20;
		in = 32'b1111_1111_0000_0001_1111_0000_0000_0001;
		#20;
		in = 32'b0000_0000_0000_1111_0000_0000_0000_1011;
		#20;
		in = 32'b0000_0000_0000_0100_0000_0000_0000_0000;
		#20;
	end
	initial
	begin
		$monitor("time = %2d, InputArr = %32b, Result = %32b", $time, in, out);
	end
endmodule 