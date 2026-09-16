// Author Juan Liscano
// CS 3339.002 Project Step 1
// NOR Testbench

`timescale 1ns/1ps
module nor_gate_tb;

reg a;
reg b;
wire y;

nor_gate uut (
	.a(a),
	.b(b),
	.y(y)
);

initial begin
	$dumpfile("nor_gate_waveform.vcd");
	$dumpvars(0, nor_gate_tb);
	$monitor("Time = %0t, a = %b, b = %b, y = %b",
		$time, a, b, y);

	a = 0;
	b = 0;
	#10;

	a = 0;
	b = 1;
	#10;

	a = 1;
	b = 0;
	#10;

	a = 1;
	b = 1;
	#10;

	$finish;
end
endmodule
