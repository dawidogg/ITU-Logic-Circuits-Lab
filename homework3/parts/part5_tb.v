module part5_tb();
    reg clk;
    reg[7:0] in;
    reg[4:0] a;
    reg reset;
    reg re;
    reg we;
    wire[7:0] out;

    part5 uut(clk, in, a, reset, re, we, out);
    
    // Clock Signal
    initial clk = 0;
    always  #10 clk = ~clk;
  
    initial begin
        // Reset all lines
        in = 15; a = 0; reset = 0; re = 1; we = 0; #10; reset = 1; #1;  
        in = 15; a = 8; reset = 0; re = 1; we = 0; #10; reset = 1; #1;
        in = 15; a = 16; reset = 0; re = 1; we = 0; #10; reset = 1; #1;
        in = 15; a = 24; reset = 0; re = 1; we = 0; #10;
        // Write 25 to Address 30
        in = 25; a = 30; reset = 0; re = 1; we = 1; #20;
        // Write 15 to Address 20
        in = 15; a = 20; reset = 0; re = 1; we = 1; #20;
        // Read Address 12
        in = 15; a = 12; reset = 0; re = 1; we = 0; #20;
        // Write 18 to Address 10
        in = 18; a = 10; reset = 0; re = 1; we = 1; #20;
        // Read address 15
        in = 1; a = 15; reset = 0; re = 1; we = 0; #20;
        // Read address 30
        in = 1; a = 30; reset = 0; re = 1; we = 0; #20;
        // Read address 10
        in = 1; a = 10; reset = 0; re = 1; we = 0; #20;
        $finish;
    end
endmodule