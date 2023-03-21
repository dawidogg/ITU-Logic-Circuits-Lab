module gate_tb;
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