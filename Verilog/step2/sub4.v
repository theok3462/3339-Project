// Author: Theo Kliewer
module sub4(
    input wire [3:0] a,
    input wire [3:0] b,
    input wire cin,
    output wire [3:0] y,
    output wire cout
);

// cin = 1 performs a - b; cin = 0 performs a - b - 1.
// cout = 1 means no borrow; cout = 0 means borrow.
assign {cout, y} = {1'b0, a} + {1'b0, ~b} + cin;

endmodule
