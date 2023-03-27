module full_adder_4_bit(s, cout, a, b, cin);
    input [3:0] a, b;
    input cin;
    output [3:0] s;
    output cout;
    wire [2:0] c;
    
    full_adder fa0(s[0], c[0], a[0], b[0], cin);
    full_adder fa1(s[1], c[1], a[1], b[1], c[0]);
    full_adder fa2(s[2], c[2], a[2], b[2], c[1]);
    full_adder fa3(s[3], cout, a[3], b[3], c[2]);
endmodule


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