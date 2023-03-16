module MUX_8_1(out, s, d);
    output out;
    input[2:0] s;
    input[7:0] d;
    wire[2:0] not_s;
    wire[7:0] minterm;
    
    NOT n0(not_s[0], s[0]);
    NOT n1(not_s[1], s[1]);
    NOT n2(not_s[2], s[2]);
    AND_4 a0(minterm[0], {not_s[2], not_s[1], not_s[0], d[0]});
    AND_4 a1(minterm[1], {not_s[2], not_s[1], s[0], d[1]});
    AND_4 a2(minterm[2], {not_s[2], s[1], not_s[0], d[2]});
    AND_4 a3(minterm[3], {not_s[2], s[1], s[0], d[3]});
    AND_4 a4(minterm[4], {s[2], not_s[1], not_s[0], d[4]});
    AND_4 a5(minterm[5], {s[2], not_s[1], s[0], d[5]});
    AND_4 a6(minterm[6], {s[2], s[1], not_s[0], d[6]});
    AND_4 a7(minterm[7], {s[2], s[1], s[0], d[7]});
    OR_8 o(out, minterm);
endmodule

module Decoder_3_8(out, s);
    output[7:0] out;
    input[2:0] s;
    wire[2:0] not_s;
    parameter enable = 1'b1;

    NOT n0(not_s[0], s[0]);
    NOT n1(not_s[1], s[1]);
    NOT n2(not_s[2], s[2]);

    AND_4 a0(out[0], {not_s[2], not_s[1], not_s[0], enable});
    AND_4 a1(out[1], {not_s[2], not_s[1], s[0], enable});
    AND_4 a2(out[2], {not_s[2], s[1], not_s[0], enable});
    AND_4 a3(out[3], {not_s[2], s[1], s[0], enable});
    AND_4 a4(out[4], {s[2], not_s[1], not_s[0], enable});
    AND_4 a5(out[5], {s[2], not_s[1], s[0], enable});
    AND_4 a6(out[6], {s[2], s[1], not_s[0], enable});
    AND_4 a7(out[7], {s[2], s[1], s[0], enable});
endmodule