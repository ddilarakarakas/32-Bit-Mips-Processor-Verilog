module InstructionMemory(inst,pc);
	output[31:0] inst;
	input[31:0] pc;
	reg[31:0] instructionMemory_read[300:0];
	initial begin
		$readmemb("C:/altera/13.1/workspace/HW4/instruction.mem", instructionMemory_read);
	end
	assign inst = instructionMemory_read[pc];
endmodule 