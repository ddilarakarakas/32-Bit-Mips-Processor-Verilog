module Memory(address,writeData,MemWrite_signal,MemRead_signal,readData,clk);
	output reg[31:0] readData;
	input[31:0] address;
	input[31:0] writeData;
	input MemWrite_signal,MemRead_signal,clk;
	reg[31:0] dataMemory [300:0];
	initial begin
		$readmemb("C:/altera/13.1/workspace/HW4/data.mem",dataMemory);
	end
	always @(posedge clk) begin
		if(MemRead_signal) begin
			readData <= dataMemory[address];
		end
		if(MemWrite_signal) begin
			dataMemory[address] <= writeData[31:0];
			$writememb("C:/altera/13.1/workspace/HW4/data.mem", dataMemory);
		end
	end
endmodule 