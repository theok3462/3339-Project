// Author Juan Liscano

// 1-bit NOR Gate
module nor_gate(
	input wire  a,
	input wire  b,
	output wire y
);

	assign y = ~(a | b);
endmodule 
