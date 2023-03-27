// Part 1

module AND(a_and_b, a, b);
    output a_and_b;
    input a, b;
    assign a_and_b = a & b;
endmodule

module AND_3(out, i);
    input [2:0] i;
    output out;
    wire and_0_1;
    AND and0(and_0_1, i[0], i[1]);
    AND and1(out, and_0_1, i[2]);
endmodule

module AND_4(out, a);
    output out;
    input[3:0] a;
    wire and_0_1, and_2_3;
    AND and0(and0_1, a[0], a[1]);
    AND and1(and2_3, a[2], a[3]);
    AND and2(out, and0_1, and2_3);
endmodule

module OR(a_or_b, a, b);
    output a_or_b;
    input a, b;
    assign a_or_b = a | b;
endmodule

module OR_3(out, i);
    input [2:0] i;
    output out;
    wire or_0_1;
    OR or0(or_0_1, i[0], i[1]);
    OR or1(out, or_0_1, i[2]);
endmodule

module OR_8(out, a);
    output out;
    input[7:0] a;
    wire[3:0] stage0;
    wire[1:0] stage1;

    OR or0(stage0[0], a[0], a[1]);
    OR or1(stage0[1], a[2], a[3]);
    OR or2(stage0[2], a[4], a[5]);
    OR or3(stage0[3], a[6], a[7]);

    OR or4(stage1[0], stage0[0], stage0[1]);
    OR or5(stage1[1], stage0[2], stage0[3]);

    OR or6(out, stage1[0], stage1[1]);
endmodule

module NOT(not_a, a);
    output not_a;
    input a;
    assign not_a = ~a;
endmodule

module XOR(a_xor_b, a, b);
    output a_xor_b;
    input a, b;
    assign a_xor_b = a&~b | ~a&b;
endmodule

module NAND(a_nand_b, a, b);
    output a_nand_b;
    input a, b;
    assign a_nand_b = ~(a & b);
endmodule

module NAND_3(out, a);
    output out;
    input[2:0] a;
    wire and_0_1;
    AND and0(and_0_1, a[0], a[1]);
    NAND nand0(out, and_0_1, a[2]);
endmodule

module MUX_8_1(out, s, d);
    output out;
    input[2:0] s;
    input[7:0] d;
    wire[2:0] not_s;
    wire[7:0] minterm;
    
    NOT not0(not_s[0], s[0]);
    NOT not1(not_s[1], s[1]);
    NOT not2(not_s[2], s[2]);
    
    AND_4 and0(minterm[0], {not_s[2], not_s[1], not_s[0], d[0]});
    AND_4 and1(minterm[1], {not_s[2], not_s[1], s[0], d[1]});
    AND_4 and2(minterm[2], {not_s[2], s[1], not_s[0], d[2]});
    AND_4 and3(minterm[3], {not_s[2], s[1], s[0], d[3]});
    AND_4 and4(minterm[4], {s[2], not_s[1], not_s[0], d[4]});
    AND_4 and5(minterm[5], {s[2], not_s[1], s[0], d[5]});
    AND_4 and6(minterm[6], {s[2], s[1], not_s[0], d[6]});
    AND_4 and7(minterm[7], {s[2], s[1], s[0], d[7]});

    OR_8 or0(out, minterm);
endmodule

module Decoder_3_8(out, s);
    output[7:0] out;
    input[2:0] s;
    wire[2:0] not_s;
    parameter enable = 1'b1;

    NOT not0(not_s[0], s[0]);
    NOT not1(not_s[1], s[1]);
    NOT not2(not_s[2], s[2]);

    AND_4 and0(out[0], {not_s[2], not_s[1], not_s[0], enable});
    AND_4 and1(out[1], {not_s[2], not_s[1], s[0], enable});
    AND_4 and2(out[2], {not_s[2], s[1], not_s[0], enable});
    AND_4 and3(out[3], {not_s[2], s[1], s[0], enable});
    AND_4 and4(out[4], {s[2], not_s[1], not_s[0], enable});
    AND_4 and5(out[5], {s[2], not_s[1], s[0], enable});
    AND_4 and6(out[6], {s[2], s[1], not_s[0], enable});
    AND_4 and7(out[7], {s[2], s[1], s[0], enable});
endmodule

// Part 2
module part2(out, a, b, c, d);
    input a, b, c, d;
    output out;
    wire not_a, not_b, not_d;
    wire [2:0] minterms;
    NOT not0(not_a, a);
    NOT not1(not_b, b);
    NOT not2(not_d, d);
    AND_3 and0(minterms[0], {not_a, b, c});
    AND_3 and1(minterms[1], {a, c, d});
    AND and2(minterms[2], not_b, not_d);
    OR_3 or0(out, minterms);
endmodule

// Part 3
module part_3(out, a, b, c, d);
    output out;
    input a, b, c, d;
    wire not_a, not_b, not_d;
    wire[2:0] minterms;
    NAND nand0(not_a, a, a);
    NAND nand1(not_b, b, b);
    NAND nand2(not_d, d, d);
    NAND_3 nand3(minterms[0], {not_a, b, c});
    NAND_3 nand4(minterms[1], {a, c, d});
    NAND nand5(minterms[2], not_b, not_d);
    NAND_3 nand6(out, minterms);
endmodule

// Part 4
module part4(out, a, b, c, d);
    input a, b, c, d;
    output out;
    wire [7:0] i;
    NOT not0(i[0], d);
    NOT not1(i[1], d);
    assign i[2] = 0;
    assign i[3] = 1;
    NOT not2(i[4], d);
    assign i[5] = 1;
    assign i[6] = 0;
    assign i[7] = d;
    
    MUX_8_1 mux0(out, {a, b, c}, i);
    
endmodule

// Part 5
module part_5(f2, f3, a, b, c);
    output f2, f3;
    input a, b, c;
    wire[7:0] decoderOutput;
    Decoder_3_8 decd0(decoderOutput, {a, b, c});
    OR or0(f2, decoderOutput[3], decoderOutput[5]);
    OR or1(f3, decoderOutput[6], decoderOutput[7]);
endmodule

// Part 6
module part_6(sum, cout, a, b);
    input a, b;
    output sum, cout;
    XOR xor0(sum, a, b);
    AND and0(cout, a, b);
endmodule

// Part 7
module full_adder(s, c_out, a, b, c_in);
    output s, c_out;
    input a, b, c_in;
    wire s_temp, c_temp_0, c_temp_1;
    half_adder ha0(s_temp, c_temp_0, a, b);
    half_adder ha1(s, c_temp_1, s_temp, c_in);
    OR or0(c_out, c_temp_0, c_temp_1);
endmodule

// Part 8
module full_adder_4_bit(s, cout, a, b, cin);
    input [3:0] a, b;
    input cin;
    output [3:0] s;
    output cout;
    wire [2:0] c;
    
    full_adder fa0(s[0], c[0], a[0], b[0], cin);
    full_adder fa1(s[1], c[1], a[1], b[1], c[0]);
    full_adder fa2(s[2], c[2], a[2], b[2], c[1]);
    full_adder fa3(s[3], cout, a[3], b[3], c[2]);
endmodule

// Part 9
module full_adder_8_bit(s, c_out, a, b, c_in);
    output[7:0] s;
    output c_out;
    input[7:0] a, b;
    input c_in;
    wire[6:0] c;
    full_adder fa0(s[0], c[0], a[0], b[0], c_in);
    full_adder fa1(s[1], c[1], a[1], b[1], c[0]);
    full_adder fa2(s[2], c[2], a[2], b[2], c[1]);
    full_adder fa3(s[3], c[3], a[3], b[3], c[2]);
    full_adder fa4(s[4], c[4], a[4], b[4], c[3]);
    full_adder fa5(s[5], c[5], a[5], b[5], c[4]);
    full_adder fa6(s[6], c[6], a[6], b[6], c[5]);
    full_adder fa7(s[7], c_out, a[7], b[7], c[6]);
endmodule

// Part 10
module adder_subtractor_16_bit(result, cout, a, b, subtract);
    input [15:0] a, b;
    input subtract;
    output [15:0] result;
    output cout;
    wire [15:0] b_after_xor;
    wire c;
    
    XOR xor0(b_after_xor[0], b[0], subtract);
    XOR xor1(b_after_xor[1], b[1], subtract);
    XOR xor2(b_after_xor[2], b[2], subtract);
    XOR xor3(b_after_xor[3], b[3], subtract);
    XOR xor4(b_after_xor[4], b[4], subtract);
    XOR xor5(b_after_xor[5], b[5], subtract);
    XOR xor6(b_after_xor[6], b[6], subtract);
    XOR xor7(b_after_xor[7], b[7], subtract);
    XOR xor8(b_after_xor[8], b[8], subtract);
    XOR xor9(b_after_xor[9], b[9], subtract);
    XOR xor10(b_after_xor[10], b[10], subtract);
    XOR xor11(b_after_xor[11], b[11], subtract);
    XOR xor12(b_after_xor[12], b[12], subtract);
    XOR xor13(b_after_xor[13], b[13], subtract);
    XOR xor14(b_after_xor[14], b[14], subtract);
    XOR xor15(b_after_xor[15], b[15], subtract);
    
    full_adder_8_bit fa0(result[7:0], c, a[7:0], b_after_xor[7:0], subtract);
    full_adder_8_bit fa1(result[15:8], cout, a[15:8], b_after_xor[15:8], c);
    
endmodule

// Part 11
module bMinus2A(result, borrow, a, b);
    output[15:0] result;
    output borrow;
    input[15:0] a, b;
    wire[15:0] bMinusA;
    wire carry0, carry1, borrow0, borrow1;

    adder_subtractor_16_bit as0(bMinusA, carry0, b, a, 1'b1);
    adder_subtractor_16_bit as1(result, carry1, bMinusA, a, 1'b1);
    NOT not0(borrow0, carry0);
    NOT not1(borrow1, carry1);
    OR o0(borrow, borrow0, borrow1);
endmodule
