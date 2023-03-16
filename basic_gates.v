module AND(a_and_b, a, b);
    output a_and_b;
    input a, b;
    assign a_and_b = a & b;
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

    OR or6(out, stage1[0], stage0[1]);
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
