// Author: Theo Kliewer
`timescale 1ns/1ps

module add4_tb;

reg [3:0] a, b;
reg cin;
wire [3:0] y;
wire cout;
integer i, j, c;
integer expected;
integer errors;

add4 uut (
    .a(a), .b(b), .cin(cin),
    .y(y), .cout(cout)
);

initial begin
    $dumpfile("add4_waveform.vcd");
    $dumpvars(0, add4_tb);
    errors = 0;

    // Test all inputs with both carry-in values.
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            for (c = 0; c < 2; c = c + 1) begin
                a = i;
                b = j;
                cin = c;
                expected = i + j + c;

                #10;
                if ({cout, y} !== expected[4:0]) begin
                    errors = errors + 1;
                    $display(
                        "FAIL: a=%d b=%d cin=%b result=%b expected=%b",
                        a, b, cin, {cout, y}, expected[4:0]
                    );
                end
            end
        end
    end

    if (errors == 0)
        $display("PASS: ADD, all 512 input combinations.");
    else
        $display("FAIL: ADD, %0d errors.", errors);

    $finish;
end

endmodule
