module OR_3(out, i);
    input [2:0] i;
    output out;
    wire or_0_1;
    OR or0(or_0_1, i[0], i[1]);
    OR or1(out, or_0_1, i[2]);
endmodule

module OR_3_tb();
    reg [2:0] i;
    wire out;
    
    OR_3 uut(out, i);
    
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