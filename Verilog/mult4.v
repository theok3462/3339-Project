module mult4 (
	input [3:0] A,
	input [3:0] B,
	output [3:0] X,
	output [3:0] Y
);

	wire [7:0] product;
	
	assign product = A * B;
	assign X = product[3:0];
	assign Y = product[7:4];
endmodule

