module AND(a_and_b, a, b);
    output a_and_b;
    input a, b;
    assign a_and_b = a & b;
endmodule

module OR(a_or_b, a, b);
    output a_or_b;
    input a, b;
    assign a_or_b = a | b;
endmodule;

module NOT(not_a, a);
    output not_a;
    input a;
    assign not_a = ~a;
endmodule;

module XOR(a_xor_b, a, b);
    output a_xor_b;
    input a, b;
    assign a_xor_b = a ^ b;
endmodule;

module NAND(a_nand_b, a, b);
    output a_nand_b;
    input a, b;
    assign a_nand_b = a ~& b;
endmodule;
