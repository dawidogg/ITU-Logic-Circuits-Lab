module or_8_tb;
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