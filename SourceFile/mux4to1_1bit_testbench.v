module mux4to1_1bit_testbench();
	reg i1,i2,i3,i4,s0,s1;
	wire result;
	mux4to1_1bit test_mux(result,i1,i2,i3,i4,s0,s1);
	initial begin
		i1 = 1'b0;i2 = 1'b0; i3 = 1'b0; i4 = 1'b0; s0 = 1'b0; s1 = 1'b0;
		#10;
		i1 = 1'b1;i2 = 1'b0; i3 = 1'b0; i4 = 1'b0; s0 = 1'b0; s1 = 1'b0;
		#10;
		i1 = 1'b0;i2 = 1'b0; i3 = 1'b0; i4 = 1'b0; s0 = 1'b1; s1 = 1'b0;
		#10;
		i1 = 1'b0;i2 = 1'b1; i3 = 1'b0; i4 = 1'b0; s0 = 1'b1; s1 = 1'b0;
		#10;
		i1 = 1'b0;i2 = 1'b0; i3 = 1'b0; i4 = 1'b0; s0 = 1'b0; s1 = 1'b1;
		#10;
		i1 = 1'b0;i2 = 1'b0; i3 = 1'b1; i4 = 1'b0; s0 = 1'b0; s1 = 1'b1;
		#10;
		i1 = 1'b0;i2 = 1'b0; i3 = 1'b0; i4 = 1'b0; s0 = 1'b1; s1 = 1'b1;
		#10;
		i1 = 1'b0;i2 = 1'b0; i3 = 1'b0; i4= 1'b1; s0 = 1'b1; s1 = 1'b1;
		#10;
	end
	initial
	begin
		$monitor("time = %2d, i1 = %1b, i2 = %1b, i3 = %1b, i4 = %1b, s1 = %1b, s0 = %1b, result = %1b", $time,i1,i2,i3,i4,s1,s0,result);
	end
endmodule
