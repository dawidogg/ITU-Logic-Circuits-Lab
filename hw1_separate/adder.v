module half_adder(s, c, a, b);
    output s, c;
    input a, b;
    XOR xor0(s, a, b);
    AND and0(c, a, b);
endmodule

module full_adder(s, c_out, a, b, c_in);
    output s, c_out;
    input a, b, c_in;
    wire s_temp, c_temp_0, c_temp_1;
    half_adder ha0(s_temp, c_temp_0, a, b);
    half_adder ha1(s, c_temp_1, s_temp, c_in);
    OR or0(c_out, c_temp_0, c_temp_1);
endmodule

module part_7_tb;
    reg[2:0] counter;
    wire a, b, c_in;
    assign {a, b, c_in} = counter;
    parameter delay = 5;
    full_adder uut(s, c_out, a, b, c_in);
    
    initial begin
        $display("PART 7 - Full adder");
        $display("a b c_in | s c_out");
        counter = 'b0;
        $monitor("%b %b %4b | %b  %4b", a, b, c_in, s, c_out);
        repeat(7) #delay counter = counter + 1;
    end
endmodule

module full_adder_8_bit(s, c_out, a, b, c_in);
    output[7:0] s;
    output c_out;
    input[7:0] a, b;
    input c_in;
    wire[6:0] c;
    full_adder fa0(s[0], c[0], a[0], b[0], c_in);
    full_adder fa1(s[1], c[1], a[1], b[1], c[0]);
    full_adder fa2(s[2], c[2], a[2], b[2], c[1]);
    full_adder fa3(s[3], c[3], a[3], b[3], c[2]);
    full_adder fa4(s[4], c[4], a[4], b[4], c[3]);
    full_adder fa5(s[5], c[5], a[5], b[5], c[4]);
    full_adder fa6(s[6], c[6], a[6], b[6], c[5]);
    full_adder fa7(s[7], c_out, a[7], b[7], c[6]);
endmodule

module part_9_tb;
    reg[7:0] a, b;
    wire[7:0] s;
    wire carry;
    full_adder_8_bit fa(s, carry, a, b, 1'b0);
    parameter delay = 5;

    initial begin
        $monitor("Time %3t: %8d + %d = %d, overflow: %b", $time, a, b, s, carry);
        a = 8'd29; b = 8'd5; #delay;
        a = 8'd51; b = 8'd92; #delay;
        a = 8'd17; b = 8'd28; #delay;
        a = 8'd191; b = 8'd2; #delay;
        a = 8'd200; b = 8'd95; #delay;
        a = 8'd49; b = 8'd25; #delay;
        a = 8'd78; b = 8'd255; #delay;
        a = 8'd43; b = 8'd59; #delay;
    end
endmodule