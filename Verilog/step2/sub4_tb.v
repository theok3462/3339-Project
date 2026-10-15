// Author: Theo Kliewer
`timescale 1ns/1ps

module sub4_tb;

reg [3:0] a, b;
reg cin;
wire [3:0] y;
wire cout;
integer i, j, c;
integer expected;
reg expected_cout;
integer errors;

sub4 uut (
    .a(a), .b(b), .cin(cin),
    .y(y), .cout(cout)
);

initial begin
    $dumpfile("sub4_waveform.vcd");
    $dumpvars(0, sub4_tb);
    errors = 0;

    // cin = 1: a - b. cin = 0: a - b - 1.
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            for (c = 0; c < 2; c = c + 1) begin
                a = i;
                b = j;
                cin = c;
                expected = i - j - (1 - c);
                expected_cout = (expected >= 0);

                #10;
                if (y !== expected[3:0] ||
                    cout !== expected_cout) begin
                    errors = errors + 1;
                    $display(
                        "FAIL: a=%d b=%d cin=%b y=%b cout=%b expected_y=%b expected_cout=%b",
                        a, b, cin, y, cout,
                        expected[3:0], expected_cout
                    );
                end
            end
        end
    end

    if (errors == 0)
        $display("PASS: SUB, all 512 input combinations.");
    else
        $display("FAIL: SUB, %0d errors.", errors);

    $finish;
end

endmodule
