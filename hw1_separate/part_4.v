module part4(out, a, b, c, d);
    input a, b, c, d;
    output out;
    wire [7:0] i;
    NOT not0(i[0], d);
    NOT not1(i[1], d);
    assign i[2] = 0;
    assign i[3] = 1;
    NOT not2(i[4], d);
    assign i[5] = 1;
    assign i[6] = 0;
    assign i[7] = d;
    
    MUX_8_1 mux0(out, {a, b, c}, i);
    
endmodule

module part_4_tb();
    reg a, b, c, d;
    wire out;
    
    part_4 uut(out, a, b, c, d);
    
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