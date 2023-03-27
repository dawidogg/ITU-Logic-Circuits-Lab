module and_4_tb;
    reg[3:0] a = 4'b0000;
    reg i;
    wire result;
    AND_4 myAnd4(result, a);
    parameter delay = 5;
    initial begin
        repeat (15)
            #delay a = a + 1;
    end
    initial begin
        $monitor("Time: %t | %b %b %b %b %b", $time, a[3], a[2], a[1], a[0], result);
    end
endmodule