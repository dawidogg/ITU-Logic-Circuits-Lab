module part_5(f2, f3, a, b ,c);
    output f2, f3;
    input a, b, c;
    wire[7:0] decoderOutput;
    Decoder_3_8 decd0(decoderOutput, {a, b, c});
    OR or0(f2, decoderOutput[3], decoderOutput[5]);
    OR or1(f3, decoderOutput[6], decoderOutput[7]);
endmodule