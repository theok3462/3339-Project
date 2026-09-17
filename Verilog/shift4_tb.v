// Author Juan Liscano
// CS 3339.002 Project Step 1
// Shift4 Testbench

`timescale 1ns/1ps
module shift4_tb;

reg [3:0] a;
wire [3:0] y;

shift4 uut (
	.a(a),
	.y(y)
);

initial begin
	$dumpfile("shift4_waveform.vcd");
	$dumpvars(0, shift4_tb);
	$monitor ("Time = %0t, a = %b, y = %b",
		$time, a, y);

	a = 4'b0000;
	#10;
	a = 4'b0001;
	#10;
	a = 4'b0010;
	#10;
	a = 4'b0100;
	#10;
	a = 4'b1000;
	#10;
	a = 4'b1011;
	#10;
	a = 4'b1111;
	#10;
	
	$finish;
end
endmodule
