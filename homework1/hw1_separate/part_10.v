module adder_subtractor_16_bit(result, cout, a, b, subtract);
    input [15:0] a, b;
    input subtract;
    output [15:0] result;
    output cout;
    wire [15:0] b_after_xor;
    wire c;
    
    XOR xor0(b_after_xor[0], b[0], subtract);
    XOR xor1(b_after_xor[1], b[1], subtract);
    XOR xor2(b_after_xor[2], b[2], subtract);
    XOR xor3(b_after_xor[3], b[3], subtract);
    XOR xor4(b_after_xor[4], b[4], subtract);
    XOR xor5(b_after_xor[5], b[5], subtract);
    XOR xor6(b_after_xor[6], b[6], subtract);
    XOR xor7(b_after_xor[7], b[7], subtract);
    XOR xor8(b_after_xor[8], b[8], subtract);
    XOR xor9(b_after_xor[9], b[9], subtract);
    XOR xor10(b_after_xor[10], b[10], subtract);
    XOR xor11(b_after_xor[11], b[11], subtract);
    XOR xor12(b_after_xor[12], b[12], subtract);
    XOR xor13(b_after_xor[13], b[13], subtract);
    XOR xor14(b_after_xor[14], b[14], subtract);
    XOR xor15(b_after_xor[15], b[15], subtract);
    
    full_adder_8_bit fa0(result[7:0], c, a[7:0], b_after_xor[7:0], subtract);
    full_adder_8_bit fa1(result[15:8], cout, a[15:8], b_after_xor[15:8], c);
    
endmodule

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