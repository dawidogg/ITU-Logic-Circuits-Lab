module part_5(f2, f3, a, b, c);
    output f2, f3;
    input a, b, c;
    wire[7:0] decoderOutput;
    Decoder_3_8 decd0(decoderOutput, {a, b, c});
    OR or0(f2, decoderOutput[3], decoderOutput[5]);
    OR or1(f3, decoderOutput[6], decoderOutput[7]);
endmodule


module part_5_tb;
    reg[2:0] counter;
    wire a, b, c;
    assign {a, b, c} = counter;

    part_5 uut(f2, f3, a, b, c);
    parameter delay = 5;

    initial begin
        $display("PART 5");
        $display("abc   f2 f3");
        $monitor("%b -> %b  %b", counter, f2, f3);
        counter = 3'b0;
        repeat(7) #delay counter = counter+1; 

    end    
endmodule;