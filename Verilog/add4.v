// Author: Theo Kliewer
module add4(
    input wire [3:0] a,
    input wire [3:0] b,
    input wire cin,
    output wire [3:0] y,
    output wire cout
);

assign {cout, y} = {1'b0, a} + {1'b0, b} + cin;

endmodule
