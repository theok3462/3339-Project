`timescale 1ns/1ps
module div4_tb;

	reg [3:0] A,B;
	wire [3:0] X,Y;
	reg [3:0] expected_q;
	reg [3:0] expected_r;
	integer errors;
	
	div4 uut (
		.A(A),
		.B(B),
		.X(X),
		.Y(Y)
	);
	
	task test_div4;
		input [3:0] a_test;
		input [3:0] b_test;
		begin
			A = a_test;
			B = b_test;

			if (B != 0) begin
				expected_q = A / B;
				expected_r = A % B;
			end

			#10;
			if (X !== expected_q || Y !== expected_r)
				begin
				$display("Failed expected was ", A,B,X,Y);
				errors = errors +1;
			end
			else begin
				$display("Pass");
			end
		end
	endtask
	initial begin
		$dumpfile("div4.vcd");
		$dumpvars(0, div4_tb);
		errors = 0;
		
		test_div4(12,3);
                test_div4(9,3);
                test_div4(15,6);
                test_div4(10,7);
                test_div4(8,2);
                test_div4(6,5);
                test_div4(2,1);
                test_div4(15,4);

		if (errors == 0)
			$display("All tests Passed");
		else
			$display("%0d tests failed", errors);
		$finish;
	end
endmodule
