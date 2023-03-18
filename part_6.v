module part_6(sum, cout, a, b);
    input a, b;
    output sum, cout;
    XOR xor0(sum, a, b);
    AND and0(cout, a, b);
endmodule

module part_6_tb();
    reg a, b;
    wire sum, cout;
    
    part_6 uut(sum, cout, a, b);
    
    initial begin
        a = 0; b = 0; #25;
        a = 0; b = 1; #25;
        a = 1; b = 0; #25;
        a = 1; b = 1; #25;
        $finish;
    end
endmodule