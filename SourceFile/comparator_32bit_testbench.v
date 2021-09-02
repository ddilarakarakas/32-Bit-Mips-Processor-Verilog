module comparator_32bit_testbench();
	reg[31:0] number;
	wire eq,less,upper;
	comparator_32bit test(number,eq,less,upper);
	initial begin
		//eq
		number = 32'b00000000000000000000000000000000;
		#20;
		//less
		number = 32'b10000000000000000000000000000000; 
		#20;
		number = 32'b10000000000000000000000000000010;
		#20;
		//upper
		number = 32'b00000000000000000000000000000010;
		#20;
	end
	initial
	begin
		$monitor("Number = %32b, eq = %1b, less = %1b, upper = %1b",number,eq,less,upper);
	end
endmodule