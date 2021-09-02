module comparator_1bit_testbench();
	reg A,B;
	wire eq,less,upper;
	comparator_1bit testForComparator(A,B,eq,less,upper);
	initial begin
		//upper
		A = 1'b1; B = 1'b0;
		#20;
		//eq
		A = 1'b0; B = 1'b0;
		#20;
		//less
		A = 1'b0; B = 1'b1;
		#20;	
	end
	initial
	begin
		$monitor("A = %1b, B = %1b, eq = %1b, less = %1b, upper = %1b",A,B,eq,less,upper);
	end
endmodule
	