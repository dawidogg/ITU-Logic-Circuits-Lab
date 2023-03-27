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


module part2_tb();
    reg a, b, c, d;
    wire out;
    
    part2 uut(out, a, b, c, d);
    
    initial begin
        a = 0; b = 0; c = 0; d = 0; #25;
        a = 0; b = 0; c = 0; d = 1; #25;
        a = 0; b = 0; c = 1; d = 0; #25;
        a = 0; b = 0; c = 1; d = 1; #25;
        a = 0; b = 1; c = 0; d = 0; #25;
        a = 0; b = 1; c = 0; d = 1; #25;
        a = 0; b = 1; c = 1; d = 0; #25;
        a = 0; b = 1; c = 1; d = 1; #25;
        a = 1; b = 0; c = 0; d = 0; #25;
        a = 1; b = 0; c = 0; d = 1; #25;
        a = 1; b = 0; c = 1; d = 0; #25;
        a = 1; b = 0; c = 1; d = 1; #25;
        a = 1; b = 1; c = 0; d = 0; #25;
        a = 1; b = 1; c = 0; d = 1; #25;
        a = 1; b = 1; c = 1; d = 0; #25;
        a = 1; b = 1; c = 1; d = 1; #25;
        $finish;
    end
endmodule