// Part 1

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

module part_1_nand_3_tb;
    reg[2:0] counter;
    parameter delay = 5;
    NAND_3 uut(s, counter);
    
    initial begin
        $display("a b c | nand");
        counter = 'b0;
        $monitor("%b %b %b | %b ", counter[2], counter[1], counter[0], s);
        repeat(7) #delay counter = counter + 1;
    end
endmodule

module part_1_gate_tb;
    reg a, b;
    wire a_and_b, a_or_b, not_a, not_b, a_xor_b, a_nand_b;
    parameter delay = 10;
    AND myAndGate(a_and_b, a, b);
    OR myOrGate(a_or_b, a, b);
    NOT myNotGate1(not_a, a);
    NOT myNotGate2(not_b, b);
    XOR myXorGate(a_xor_b, a, b);
    NAND myNANDGate(a_nand_b, a, b);
    initial begin
        a = 0; b = 0;
        #delay;
        a = 0; b = 1;
        #delay;
        a = 1; b = 0;
        #delay;
        a = 1; b = 1;
        #delay;
        $finish;
    end
    initial begin
        $display(" Time     a     b    ~a    ~b   a&b   a|b   a^b  a~&b");
        $monitor("%5t %5b %5b %5b %5b %5b %5b %5b %5b", $time, a, b, not_a, not_b, a_and_b, a_or_b, a_xor_b, a_nand_b);
    end;
endmodule

module part_1_or_8_tb;
    reg[7:0] a = 8'b0;
    reg i;
    wire result;
    OR_8 myOr8(result, a);
    parameter delay = 5;
    initial begin
        repeat (255)
            #delay a = a + 1;
    end
    initial begin
        $monitor("Time: %t | %b %b %b %b %b %b %b %b %b", $time, a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0], result);
    end
endmodule

// Part 2
module part2_tb();
    reg a, b, c, d;
    wire out;
    
    part2 uut(out, a, b, c, d);
    
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

// Part 3
module part_3_tb;
    reg[3:0] counter;
    wire a, b, c, d;
    assign {a, b, c, d} = counter;

    part_3 uut(out, a, b, c, d);
    parameter delay = 5;

    initial begin
        $display("abcd    f1");
        $monitor("%b -> %b", counter, out);
        counter = 4'b0;
        repeat(15) #delay counter = counter+1; 

    end    
endmodule;

// Part 4

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

// Part 5

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

// Part 6
module part_6_tb();
    reg a, b;
    wire sum, cout;
    
    part_6 uut(sum, cout, a, b);
    
    initial begin
        a = 0; b = 0; #25;
        a = 0; b = 1; #25;
        a = 1; b = 0; #25;
        a = 1; b = 1; #25;
        $finish;
    end
endmodule

// Part 7
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

// Part 8
module full_adder_4_bit_tb();
    reg [3:0] a, b;
    reg cin;
    wire [3:0] s;
    wire cout;
    
    
    full_adder_4_bit uut(s, cout, a, b, cin);
    
    initial begin
        a = 4'd8; b = 4'd1; cin = 1'b0; #25;
        a = 4'd2; b = 4'd7; cin = 1'b0; #25;
        a = 4'd4; b = 4'd5; cin = 1'b0; #25;
        a = 4'd11; b = 4'd10; cin = 1'b0; #25;
        a = 4'd14; b = 4'd5; cin = 1'b0; #25;
        a = 4'd15; b = 4'd9; cin = 1'b0; #25;
        a = 4'd6; b = 4'd3; cin = 1'b0; #25;
        a = 4'd8; b = 4'd12; cin = 1'b0; #25;
        $finish;
    end
    
endmodule   

// Part 9
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

// Part 10

module adder_subtractor_16_bit_tb();
    reg [15:0] a, b;
    reg subtract;
    wire [15:0] result;
    wire cout;
    
    adder_subtractor_16_bit uut(result, cout, a, b, subtract);
    
    initial begin
        $monitor("%d %d %d \ncarry: %b", a, b, result, cout);
        //Addition
        $display("Addition\n");
        a = 16'd23; b = 16'd3; subtract = 1'b0; #25;
        a = 16'd21; b = 16'd75; subtract = 1'b0; #25;
        a = 16'd16800; b = 16'd16900; subtract = 1'b0; #25;
        a = 16'd6983; b = 16'd6650; subtract = 1'b0; #25;
        a = 16'd325; b = 16'd97; subtract = 1'b0; #25;
        a = 16'd44; b = 16'd190; subtract = 1'b0; #25;
        a = 16'd463; b = 16'd241; subtract = 1'b0; #25;
        a = 16'd86; b = 16'd572; subtract = 1'b0; #25;
        //Subtraction
        $display("Subtraction\n");
        a = 16'd23; b = 16'd3; subtract = 1'b1; #25;
        a = 16'd21; b = 16'd75; subtract = 1'b1; #25;
        a = 16'd16800; b = 16'd16900; subtract = 1'b1; #25;
        a = 16'd6983; b = 16'd6650; subtract = 1'b1; #25;
        a = 16'd325; b = 16'd97; subtract = 1'b1; #25;
        a = 16'd44; b = 16'd190; subtract = 1'b1; #25;
        a = 16'd463; b = 16'd241; subtract = 1'b1; #25;
        a = 16'd86; b = 16'd572; subtract = 1'b1; #25;
        $finish;
    end
    
endmodule

// Part 11
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