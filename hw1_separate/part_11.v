module bMinus2A(result, borrow, a, b);
    output[15:0] result;
    output borrow;
    input[15:0] a, b;
    wire[15:0] bMinusA;
    wire carry0, carry1, borrow0, borrow1;

    adder_subtractor_16_bit as0(bMinusA, carry0, b, a, 1'b1);
    adder_subtractor_16_bit as1(result, carry1, bMinusA, a, 1'b1);
    NOT not0(borrow0, carry0);
    NOT not1(borrow1, carry1);
    OR o0(borrow, borrow0, borrow1);
endmodule

module part_11_tb;
    reg[15:0] a, b;
    wire[15:0] result;
    bMinus2A uut(result, borrow, a, b);
    parameter delay = 5;
    initial begin
        $monitor("A = %d \nB = %d \nB - 2A = %d, borrow = %b\n", a, b, result, borrow);
        a = 16'd32; b = 16'd7; #delay; 
        a = 16'd21; b = 16'd85; #delay; 
        a = 16'd16; b = 16'd36; #delay; 
        a = 16'd256; b = 16'd5; #delay; 
        a = 16'd200; b = 16'd95; #delay; 
        a = 16'd45; b = 16'd135; #delay; 
        a = 16'd36; b = 16'd255; #delay; 
        a = 16'd25; b = 16'd65; #delay; 
    end
endmodule 