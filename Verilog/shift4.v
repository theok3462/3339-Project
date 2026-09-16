// Author Juan Liscano
// CS 3339.002 Project step 1
// shift4

module shift4(
	input wire[3:0] a,
	output wire [3:0] y
);
	assign y = a << 1;
endmodule

