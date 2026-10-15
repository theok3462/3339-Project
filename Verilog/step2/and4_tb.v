// Author: Theo Kliewer
`timescale 1ns/1ps

module and4_tb;

reg [3:0] a, b;
wire [3:0] y;
integer i, j, k;
integer errors;
reg [3:0] expected;

and4 uut (.a(a), .b(b), .y(y));

initial begin
    $dumpfile("and4_waveform.vcd");
    $dumpvars(0, and4_tb);
    errors = 0;

    // Test every pair of four-bit inputs.
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            a = i;
            b = j;

            // An AND bit is 1 only when both input bits are 1.
            for (k = 0; k < 4; k = k + 1)
                expected[k] = (a[k] == 1'b1 && b[k] == 1'b1);

            #10;
            if (y !== expected) begin
                errors = errors + 1;
                $display("FAIL: a=%b b=%b y=%b expected=%b",
                         a, b, y, expected);
            end
        end
    end

    if (errors == 0)
        $display("PASS: AND, all 256 input combinations.");
    else
        $display("FAIL: AND, %0d errors.", errors);

    $finish;
end

endmodule
