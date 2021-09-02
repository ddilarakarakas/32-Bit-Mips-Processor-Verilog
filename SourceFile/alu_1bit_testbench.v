module alu_1bit_testbench(); 
	reg a, b, carry_in ,op0,op1,op2;
	wire result, carry_out;
	alu_1bit alu_(result, carry_out, carry_in, a, b ,op2,op1,op0);
	initial begin
		// AND OP: 000
		op2 = 1'b0; op1= 1'b0; op0 = 1'b0; a = 1'b0; b = 1'b0; carry_in = 1'b0;
		#10;
		op2 = 1'b0; op1= 1'b0; op0 = 1'b0; a = 1'b1; b = 1'b1; carry_in = 1'b0;
		#10;
		op2 = 1'b0; op1= 1'b0; op0 = 1'b0; a = 1'b1; b = 1'b0; carry_in = 1'b0;
		#10;
		op2 = 1'b0; op1= 1'b0; op0 = 1'b0; a = 1'b0; b = 1'b1; carry_in = 1'b0;
		#10;
		op2 = 1'b0; op1= 1'b0; op0 = 1'b0; a = 1'b1; b = 1'b1; carry_in = 1'b1;
		#10;
		// OR OP: 001
		op2 = 1'b0; op1= 1'b0; op0 = 1'b1; a = 1'b0; b = 1'b0; carry_in = 1'b0;
		#10;
		op2 = 1'b0; op1= 1'b0; op0 = 1'b1; a = 1'b1; b = 1'b1; carry_in = 1'b0;
		#10;
		op2 = 1'b0; op1= 1'b0; op0 = 1'b1; a = 1'b1; b = 1'b0; carry_in = 1'b0;
		#10;
		op2 = 1'b0; op1= 1'b0; op0 = 1'b1; a = 1'b0; b = 1'b1; carry_in = 1'b0;
		#10;
		op2 = 1'b0; op1= 1'b0; op0 = 1'b1; a = 1'b1; b = 1'b1; carry_in = 1'b1;
		#10;
		// ADD OP: 010
		op2 = 1'b0; op1= 1'b1; op0 = 1'b0; a = 1'b0; b = 1'b0; carry_in = 1'b0;
		#10;
		op2 = 1'b0; op1= 1'b1; op0 = 1'b0; a = 1'b1; b = 1'b1; carry_in = 1'b0;
		#10;
		op2 = 1'b0; op1= 1'b1; op0 = 1'b0; a = 1'b1; b = 1'b0; carry_in = 1'b0;
		#10;
		op2 = 1'b0; op1= 1'b1; op0 = 1'b0; a = 1'b0; b = 1'b1; carry_in = 1'b0;
		#10;
		op2 = 1'b0; op1= 1'b1; op0 = 1'b0; a = 1'b1; b = 1'b1; carry_in = 1'b1;
		#10
		//SUBTRACT OP: 110
		op2 = 1'b1; op1= 1'b1; op0 = 1'b0; a = 1'b0; b = 1'b0; carry_in = 1'b1;
		#10;
		op2 = 1'b1; op1= 1'b1; op0 = 1'b0; a = 1'b1; b = 1'b0; carry_in = 1'b1;
		#10;
		op2 = 1'b1; op1= 1'b1; op0 = 1'b0; a = 1'b0; b = 1'b1; carry_in = 1'b1;
		#10;
		op2 = 1'b1; op1= 1'b1; op0 = 1'b0; a = 1'b1; b = 1'b1; carry_in = 1'b1;
		#10;
		// XOR OP: 011
		op2 = 1'b0; op1= 1'b1; op0 = 1'b1; a = 1'b0; b = 1'b0; carry_in = 1'b0;
		#10;
		op2 = 1'b0; op1= 1'b1; op0 = 1'b1; a = 1'b1; b = 1'b1; carry_in = 1'b0;
		#10;
		op2 = 1'b0; op1= 1'b1; op0 = 1'b1; a = 1'b1; b = 1'b0; carry_in = 1'b0;
		#10;
		op2 = 1'b0; op1= 1'b1; op0 = 1'b1; a = 1'b0; b = 1'b1; carry_in = 1'b0;
		#10;
		op2 = 1'b0; op1= 1'b1; op0 = 1'b1; a = 1'b1; b = 1'b1; carry_in = 1'b1;
		#10;	
	end
	initial begin
	$monitor("time =%2d,	OPCODE = %1b %1b %1b ,	Ai = %1b,	Bi = %1b,	Cin = %1b,	Cout = %1b,	Result = %1b", $time, op2,op1,op0, a, b, carry_in, carry_out, result);
	end
endmodule 	