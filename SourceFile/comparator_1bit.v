module comparator_1bit(A,B,eq,less,upper);
	output eq, less, upper;
	input A,B;
	wire not_A;
	wire not_B;
	not(not_A,A);
	not(not_B,B);
	// less A < B
	and(less,not_A,B);
	// upper A > B
	and(upper,not_B,A);
	nor(eq,less,upper);
endmodule 