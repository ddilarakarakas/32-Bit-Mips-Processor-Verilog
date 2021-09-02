module mux4to1_2bit_testbench();
	wire[1:0]result;
	reg[1:0]i1;
	reg[1:0]i2;
	reg[1:0]i3;
	reg[1:0]i4;
	reg s0;
	reg s1;
	mux4to1_2bit mux(result,i1,i2,i3,i4,s0,s1);
	initial begin
		i1 = 2'b0;i2 = 2'b0; i3 = 2'b0; i4 = 2'b0; s0 = 2'b0; s1 = 2'b0;
		#20;
		i1 = 2'b1;i2 = 2'b0; i3 = 2'b0; i4 = 2'b0; s0 = 2'b0; s1 = 2'b0;
		#20;
		i1 = 2'b0;i2 = 2'b0; i3 = 2'b0; i4 = 2'b0; s0 = 2'b1; s1 = 2'b0;
		#20;
		i1 = 2'b0;i2 = 2'b1; i3 = 2'b0; i4 = 2'b0; s0 = 2'b1; s1 = 2'b0;
		#20;
		i1 = 2'b0;i2 = 2'b0; i3 = 2'b0; i4 = 2'b0; s0 = 2'b0; s1 = 2'b1;
		#20;
		i1 = 2'b0;i2 = 2'b0; i3 = 2'b1; i4 = 2'b0; s0 = 2'b0; s1 = 2'b1;
		#20;
		i1 = 2'b0;i2 = 2'b0; i3 = 2'b0; i4 = 2'b0; s0 = 2'b1; s1 = 2'b1;
		#20;
		i1 = 2'b0;i2 = 2'b0; i3 = 2'b0; i4 = 2'b1; s0 = 2'b1; s1 = 2'b1;
		#20;
	end
	initial begin
		$monitor("time = %2d, i1 = %2b, i2 = %2b, i3 = %2b, i4 = %2b, s1 = %1b, s0 = %1b, result = %2b", $time,i1,i2,i3,i4,s1,s0,result);
	end
endmodule	
