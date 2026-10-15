// Author: Theo Kliewer
`timescale 1ns/1ps

module xnor4_tb;

reg [3:0] a, b;
wire [3:0] y;
reg [3:0] expected;
integer i, j, k;
integer errors;

xnor4 uut (.a(a), .b(b), .y(y));

initial begin
    $dumpfile("xnor4_waveform.vcd");
    $dumpvars(0, xnor4_tb);
    errors = 0;

    // Test every pair of four-bit inputs.
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            a = i;
            b = j;

            for (k = 0; k < 4; k = k + 1)
                expected[k] = (a[k] == b[k]);

            #10;
            if (y !== expected) begin
                errors = errors + 1;
                $display("FAIL: a=%b b=%b y=%b expected=%b",
                         a, b, y, expected);
            end
        end
    end

    if (errors == 0)
        $display("PASS: XNOR, all 256 input combinations.");
    else
        $display("FAIL: XNOR, %0d errors.", errors);

    $finish;
end

endmodule
