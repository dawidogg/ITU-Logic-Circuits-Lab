module part_9_tb;
    reg[7:0] a, b;
    wire[7:0] s;
    wire carry;
    full_adder_8_bit fa(s, carry, a, b, 1'b0);
    parameter delay = 5;

    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0, s);
    end
    initial begin
        $monitor("Time %3t: %8d + %d = %d, overflow: %b", $time, a, b, s, carry);

        a = 8'd29; b = 8'd5;
        #delay;

        a = 8'd51; b = 8'd92;
        #delay;

        a = 8'd17; b = 8'd28;
        #delay;

        a = 8'd191; b = 8'd2;
        #delay;

        a = 8'd200; b = 8'd95;
        #delay;

        a = 8'd49; b = 8'd25;
        #delay;

        a = 8'd78; b = 8'd255;
        #delay;

        a = 8'd43; b = 8'd59;
        #delay;
    end

endmodule