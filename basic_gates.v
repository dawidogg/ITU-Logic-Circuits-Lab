module AND(a_and_b, a, b);
    output a_and_b;
    input a, b;
    assign a_and_b = a & b;
endmodule

module AND_4(out, a);
    output out;
    input[3:0] a;
    wire and_0_1, and_2_3;
    AND a1(and0_1, a[0], a[1]);
    AND a2(and2_3, a[2], a[3]);
    AND a3(out, and0_1, and2_3);
endmodule

module OR(a_or_b, a, b);
    output a_or_b;
    input a, b;
    assign a_or_b = a | b;
endmodule

module OR_8(out, a);
    output out;
    input[7:0] a;
    wire[3:0] stage1;
    wire[1:0] stage2;

    OR o0(stage1[0], a[0], a[1]);
    OR o1(stage1[1], a[2], a[3]);
    OR o2(stage1[2], a[4], a[5]);
    OR o3(stage1[3], a[6], a[7]);

    OR o4(stage2[0], stage1[0], stage1[1]);
    OR o5(stage2[1], stage1[2], stage1[3]);

    OR o6(out, stage2[0], stage2[1]);
endmodule

module NOT(not_a, a);
    output not_a;
    input a;
    assign not_a = ~a;
endmodule

module XOR(a_xor_b, a, b);
    output a_xor_b;
    input a, b;
    assign a_xor_b = a ^ b;
endmodule

module NAND(a_nand_b, a, b);
    output a_nand_b;
    input a, b;
    assign a_nand_b = a ~& b;
endmodule
