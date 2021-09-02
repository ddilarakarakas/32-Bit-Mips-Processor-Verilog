module alu_32bit_testbench();
	reg[31:0] a;
	reg[31:0] b;
	reg op0,op1,op2;
	wire ifBeq;
	wire[31:0] result;
	alu_32bit alu_(result, ifBeq, a, b ,op2,op1,op0);
	initial begin
		// AND OP: 000
		op2 = 1'b0; op1= 1'b0; op0 = 1'b0; a = 32'b0; b =32'b0; 
		#30;
		op2 = 1'b0; op1= 1'b0; op0 = 1'b0; a = 32'b1; b =32'b0;  
		#30;
		op2 = 1'b0; op1= 1'b0; op0 = 1'b0; a = 32'b1; b =32'b1; 
		#30;
		op2 = 1'b0; op1= 1'b0; op0 = 1'b0; a = 32'b0; b =32'b1; 
		#30;
		// OR OP: 001
		op2 = 1'b0; op1= 1'b0; op0 = 1'b1; a = 32'b0; b =32'b0;  
		#30;
		op2 = 1'b0; op1= 1'b0; op0 = 1'b1; a = 32'b1; b =32'b0; 
		#30;
		op2 = 1'b0; op1= 1'b0; op0 = 1'b1; a = 32'b0; b =32'b1; 
		#30;
		op2 = 1'b0; op1= 1'b0; op0 = 1'b1; a = 32'b1; b =32'b1; 
		#30;
		// ADD OP: 010
		op2 = 1'b0; op1= 1'b1; op0 = 1'b0; a = 32'b0; b =32'b0; 
		#30;
		op2 = 1'b0; op1= 1'b1; op0 = 1'b0; a = 32'b1; b =32'b0;  
		#30;
		op2 = 1'b0; op1= 1'b1; op0 = 1'b0; a = 32'b0; b =32'b1;  
		#30;
		op2 = 1'b0; op1= 1'b1; op0 = 1'b0; a = 32'b1; b =32'b1;  
		#30;
		//SUBTRACT OP: 110
		op2 = 1'b1; op1= 1'b1; op0 = 1'b0; a = 32'b0; b =32'b0; 
		#30;
		op2 = 1'b1; op1= 1'b1; op0 = 1'b0; a = 32'b1; b =32'b0; 
		#30;
		op2 = 1'b1; op1= 1'b1; op0 = 1'b0; a = 32'b0; b =32'b1; 
		#30;
		op2 = 1'b1; op1= 1'b1; op0 = 1'b0; a = 32'b1; b =32'b1; 
		#30;
		// XOR OP: 011
		op2 = 1'b0; op1= 1'b1; op0 = 1'b1; a = 32'b0; b =32'b0; 
		#30;
		op2 = 1'b0; op1= 1'b1; op0 = 1'b1; a = 32'b1; b =32'b0; 
		#30;
		op2 = 1'b0; op1= 1'b1; op0 = 1'b1; a = 32'b0; b =32'b1; 
		#30;
		op2 = 1'b0; op1= 1'b1; op0 = 1'b1; a = 32'b1; b =32'b1; 
		#30;
	end
	initial begin
	$monitor("time =%2d,	OPCODE = %1b %1b %1b , Ai = %32b, Bi = %32b, Result = %32b, ifBeq = %1b", $time, op2,op1,op0, a, b, result, ifBeq);
	end
endmodule 