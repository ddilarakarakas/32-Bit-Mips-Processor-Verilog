module InstructionMemory_testbench();
	reg [31:0] program_counter;
	wire [31:0] instruction ;
	InstructionMemory test( instruction, program_counter );
	initial begin
		program_counter = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
		#20;
		program_counter = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
		#20;
		program_counter = 32'b0000_0000_0000_0000_0000_0000_0000_0010;
		#20;
		program_counter = 32'b0000_0000_0000_0000_0000_0000_0000_0011;
		#20;
	end
	initial begin
		$monitor(" time = %2d, Insruction: %32b", $time, instruction);
	end
endmodule 