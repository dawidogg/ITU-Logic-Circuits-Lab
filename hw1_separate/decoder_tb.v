module part_1_decoder_tb;
    reg[2:0] combination = 3'b000;
    wire[7:0] out;
    Decoder_3_8 myDecoder(out, combination);
    initial begin
        $display("Testing decoder...");
        $monitor("%b %b", combination, out);
        repeat(7)
            #10 combination = combination + 1;
    end
endmodule;