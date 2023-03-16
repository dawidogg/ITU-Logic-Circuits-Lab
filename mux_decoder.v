module MUX_8_1(y, s0, s1, s2, d0, d1, d2, d3, d4, d5, d6, d7);
    output y;
    input s0, s1, s2, d0, d1, d2, d3, d4, d5, d6, d7;
    wire not_s0, not_s1, not_s2;
    wire[7:0] minterm;
    NOT n0(not_s0, s0);
    NOT n1(not_s1, s1);
    NOT n2(not_s2, s2);
    AND_4 a0(minterm[0], {not_s0, not_s1, not_s2, d0});
    AND_4 a1(minterm[1], {not_s0, not_s1, s2, d1});
    AND_4 a2(minterm[2], {not_s0, s1, not_s2, d2});
    AND_4 a3(minterm[3], {not_s0, s1, s2, d3});
    AND_4 a4(minterm[4], {s0, not_s1, not_s2, d4});
    AND_4 a5(minterm[5], {s0, not_s1, s2, d5});
    AND_4 a6(minterm[6], {s0, s1, not_s2, d6});
    AND_4 a7(minterm[7], {s0, s1, s2, d7});
    OR_8 o(y, minterm);
endmodule

module Decoder_3_8(out, s);

endmodule