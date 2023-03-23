module part_1_mux_tb;
    reg[2:0] s;
    reg[7:0] d;
    MUX_8_1 uut(out, s, d);
    parameter delay = 5;
    initial begin
        d = 8'b11101010;
        s = 3'b000;
        $display("For inputs %b", d);
        $monitor("%b -> %b", s, out);
        repeat(8) #delay s = s+1; 

        d = 8'b00100011;
        $display("\nFor inputs %b", d);        
        repeat(8) #delay s = s+1; 

        d = 8'b00000000;
        $display("\nFor inputs %b", d);
        repeat(8) #delay s = s+1; 

    end
endmodule;