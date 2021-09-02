module bus_testbench();
	wire[31:0] out;
	reg[25:0] ins;
	reg[3:0] pc;
	bus testBus(out,ins,pc);
	initial begin
		ins = 26'b11_1111_1111_1111_1111_1111_1111; pc = 4'b0010;
		#20;
		ins = 26'b01_1111_1001_1101_0000_1111_1111; pc = 4'b0010;
		#20;
		ins = 26'b00_0000_1001_0000_0000_1111_1111; pc = 4'b1010;
		#20;
	end
	initial
	begin
		$monitor("time = %2d, Ins = %26b, Pc = %4b, Result = %32b", $time, ins,pc,out);
	end
endmodule 