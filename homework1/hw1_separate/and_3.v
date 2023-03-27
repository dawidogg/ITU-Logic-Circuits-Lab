module AND_3(out, i);
    input [2:0] i;
    output out;
    wire and_0_1;
    AND and0(and_0_1, i[0], i[1]);
    AND and1(out, and_0_1, i[2]);
endmodule

module AND_3_tb();
    reg [2:0] i;
    wire out;
    
    AND_3 uut(out, i);
    
    initial begin
        i = 3'b000; #25;
        i = 3'b001; #25;
        i = 3'b010; #25;
        i = 3'b011; #25;
        i = 3'b100; #25;
        i = 3'b101; #25;
        i = 3'b110; #25;
        i = 3'b111; #25;
        $finish;
    end
endmodule