`timescale 1ns/1ps
module mult4_tb;
	reg [3:0] A, B;
	wire [3:0] X, Y;
	reg [7:0] expected;
	integer errors;

	mult4 uut (
		.A(A),
		.B(B),
		.X(X),
		.Y(Y)
	);

	task test_mult;
		input [3:0] a_test;
		input [3:0] b_test;
		begin
			A = a_test;
			B = b_test;
			expected = a_test * b_test;
			#10;
			
			if ({Y,X} !== expected) begin
				$display("Failed, expected was ",
				A, B, {Y,X}, expected);
				errors = errors +1;
			end
			else begin
				$display("Pass");
			end
		end
	endtask
	
	initial begin
		$dumpfile("mult4.vcd");
		$dumpvars(0, mult4_tb);
		errors = 0;
		
		test_mult(0,0);
		test_mult(4,8);
                test_mult(6,7);
                test_mult(3,3);
                test_mult(2,10);
                test_mult(5,13);
                test_mult(6,9);
                test_mult(13,13);
		
		if (errors == 0)
			$display("All mult Tests passed");
		else
			$display("%0d multi tests failed", errors);

		$finish;
	end
endmodule

