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
//////////////////////
module part_1_nand_3_tb;
    reg[2:0] counter;
    parameter delay = 5;
    NAND_3 uut(s, counter);
    
    initial begin
        $display("a b c | nand");
        counter = 'b0;
        $monitor("%b %b %b | %b ", counter[2], counter[1], counter[0], s);
        repeat(7) #delay counter = counter + 1;
    end
endmodule

module part_1_gate_tb;
    reg a, b;
    wire a_and_b, a_or_b, not_a, not_b, a_xor_b, a_nand_b;
    parameter delay = 10;
    AND myAndGate(a_and_b, a, b);
    OR myOrGate(a_or_b, a, b);
    NOT myNotGate1(not_a, a);
    NOT myNotGate2(not_b, b);
    XOR myXorGate(a_xor_b, a, b);
    NAND myNANDGate(a_nand_b, a, b);
    initial begin
        a = 0; b = 0;
        #delay;
        a = 0; b = 1;
        #delay;
        a = 1; b = 0;
        #delay;
        a = 1; b = 1;
        #delay;
        $finish;
    end
    initial begin
        $display(" Time     a     b    ~a    ~b   a&b   a|b   a^b  a~&b");
        $monitor("%5t %5b %5b %5b %5b %5b %5b %5b %5b", $time, a, b, not_a, not_b, a_and_b, a_or_b, a_xor_b, a_nand_b);
    end;
    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0, a, b, not_a, not_b, a_and_b, a_or_b, a_xor_b, a_nand_b);
    end
endmodule

module part_1_or_8_tb;
    reg[7:0] a = 8'b0;
    reg i;
    wire result;
    OR_8 myOr8(result, a);
    parameter delay = 5;
    initial begin
        repeat (255)
            #delay a = a + 1;
    end
    initial begin
        $monitor("Time: %t | %b %b %b %b %b %b %b %b %b", $time, a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0], result);
    end
endmodule