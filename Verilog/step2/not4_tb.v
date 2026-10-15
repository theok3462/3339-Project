// Author: Theo Kliewer
`timescale 1ns/1ps

module not4_tb;

reg [3:0] a;
wire [3:0] y;
reg [3:0] expected;
integer i, k;
integer errors;

not4 uut (.a(a), .y(y));

initial begin
    $dumpfile("not4_waveform.vcd");
    $dumpvars(0, not4_tb);
    errors = 0;

    // Test all sixteen four-bit inputs.
    for (i = 0; i < 16; i = i + 1) begin
        a = i;

        for (k = 0; k < 4; k = k + 1)
            expected[k] = (a[k] == 1'b0);

        #10;
        if (y !== expected) begin
            errors = errors + 1;
            $display("FAIL: a=%b y=%b expected=%b",
                     a, y, expected);
        end
    end

    if (errors == 0)
        $display("PASS: NOT, all 16 input combinations.");
    else
        $display("FAIL: NOT, %0d errors.", errors);

    $finish;
end

endmodule
