module ALUControl_testbench();
	wire op2,op1,op0;
	reg[1:0] ALUop;
	reg[5:0] functionField;
	ALUControl testControl(functionField,ALUop,op2,op1,op0);
	initial begin
		// lw and sw
		ALUop = 2'b00; functionField = 6'bxxxxxx;
		#20;
		// beq bne
		ALUop = 2'b01;	functionField = 6'bxxxxxx;
		#20;
		//addn 
		ALUop = 2'b10;	functionField = 6'b100000;
		#20;
		//subn
		ALUop = 2'b10;	functionField = 6'b100010;
		#20;
		//andn
		ALUop = 2'b10;	functionField = 6'b100100;
		#20;
		//orn
		ALUop = 2'b10;	functionField = 6'b100101;
		#20;
		//xorn
		ALUop = 2'b10;	functionField = 6'b100110;
		#20;
	end
	initial begin
		$monitor("ALUop = %2b, Function Field = %6b, Operation = %1b%1b%1b",ALUop,functionField,op2,op1,op0);
	end
endmodule
