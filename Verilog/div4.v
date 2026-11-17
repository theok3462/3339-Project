module div4(
	input [3:0] A,
	input [3:0] B,
	output [3:0] X,
	output [3:0] Y
);

	assign X =  A / B;
	assign Y = A % B;
endmodule 
