
module alu4_controller (
    input wire [3:0] A,
    input wire [3:0] B,
    input wire [3:0] opcode,
    input wire cin,
    output reg [3:0] X,
    output reg [3:0] Y,
    output reg cout
);
    wire [3:0] and_result, nand_result, or_result, nor_result;
    wire [3:0] xor_result, xnor_result, not_result;
    wire [3:0] add_result, sub_result, mult_low, mult_high;
    wire [3:0] div_quotient, div_remainder, shift_result, shift_overflow;
    wire add_cout, sub_cout;

    and4 u_and (.a(A), .b(B), .y(and_result));
    nand4 u_nand (.a(A), .b(B), .y(nand_result));
    or4 u_or (.a(A), .b(B), .y(or_result));
    nor4 u_nor (.a(A), .b(B), .y(nor_result));
    xor4 u_xor (.a(A), .b(B), .y(xor_result));
    xnor4 u_xnor (.a(A), .b(B), .y(xnor_result));
    not4 u_not (.a(A), .y(not_result));
    add4 u_add (.a(A), .b(B), .cin(cin), .y(add_result), .cout(add_cout));
    sub4 u_sub (.a(A), .b(B), .cin(cin), .y(sub_result), .cout(sub_cout));
    mult4 u_mult (.A(A), .B(B), .X(mult_low), .Y(mult_high));
    div4 u_div (.A(A), .B(B), .X(div_quotient), .Y(div_remainder));
    shift4_ProjectStatus2 u_shift (.A(A), .B(B), .X(shift_result), .Y(shift_overflow));

    always @(*) begin
        X = 4'b0000;
        Y = 4'b0000;
        cout = 1'b0;
        case (opcode)
            4'h0: X = and_result;
            4'h1: X = nand_result;
            4'h2: X = or_result;
            4'h3: X = nor_result;
            4'h4: X = xor_result;
            4'h5: X = xnor_result;
            4'h6: X = not_result;
            4'h7: begin X = shift_result; Y = shift_overflow; end
            4'h8: begin X = add_result; cout = add_cout; end
            4'h9: begin X = sub_result; cout = sub_cout; end
            4'hA: begin X = mult_low; Y = mult_high; end
            4'hB: begin X = div_quotient; Y = div_remainder; end
            default: begin X = 4'b0000; Y = 4'b0000; cout = 1'b0; end
        endcase
    end
endmodule
