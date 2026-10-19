// Author: Juan Liscano
// CS 3339 Project Status 2

module shift4_ProjectStatus2 (
	input [3:0] A,
	input [3:0] B,
	output reg [3:0] X,
	output reg [3:0] Y
);

	integer i;
	always @(*) begin
	X = A;
	Y = 4'b0000;
		for (i = 0; i < 3; i = i +1) begin
			if (i < B[2:1]) begin
				if (B[3] == 0) begin
					Y = {Y[2:0], X[3]};
					X = {X[2:0], B[0]};
				end
				else begin
					Y = {X[0], Y[3:1]};
					X = {B[0], X[3:1]};
				end
			end
		end
	end
endmodule

