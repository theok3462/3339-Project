// Author Juan Liscano
// CS 3339

`timescale 1ns/1ps
module shift4_ProjectStatus2_tb;
	reg [3:0] A, B;
	wire [3:0] X, Y;
	integer errors;
	shift4_ProjectStatus2 uut (
		.A(A),
		.B(B),
		.X(X),
		.Y(Y)
	);
	
	task test_shift;
		input [3:0] a_test, b_test;
		input [3:0] expected_x, expected_y;
		begin
			A = a_test;
			B = b_test;
			#10;
			
			if (X !== expected_x || Y !== expected_y) begin
				$display("Fail");
				errors = errors +1;
			end
			else begin
				$display("Pass");
			end
		end
	endtask
	initial begin
		$dumpfile("shift4_ProjectStatus2.vcd");
		$dumpvars(0, shift4_ProjectStatus2_tb);
	
		errors = 0;
		test_shift(4'b0110, 4'b0110, 4'b0000, 4'b0011);
                test_shift(4'b1010, 4'b0101, 4'b1011, 4'b0010);
                test_shift(4'b0111, 4'b1011, 4'b1011, 4'b1000);
                test_shift(4'b0101, 4'b1000, 4'b0101, 4'b0000);
                test_shift(4'b1001, 4'b0100, 4'b0100, 4'b0010);
                test_shift(4'b1011, 4'b0110, 4'b1000, 4'b0101);
                test_shift(4'b1011, 4'b0110, 4'b1000, 4'b0101);
		
		if (errors ==0)
			$display("All tests passed");
		else $display("%0d tests failed", errors);
		$finish;
	end
endmodule

