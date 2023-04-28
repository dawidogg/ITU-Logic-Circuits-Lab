`include "part1.v"

module part3_tb;
  reg[7:0] in;
  reg clk, re, we, reset, linesel;
  wire[7:0] out;
  part3 uut(clk, in, re, we, reset, linesel, out);

  initial repeat(8) #5 clk = ~clk;

  initial begin
    $dumpvars;
    $display("%6s | %6s | %6s | %6s | %7s | %6s || %6s", "Clock", "Input", "Read", "Write", "LineSel", "Reset", "Output");
    $display({65{"-"}});
    $monitor("%6b | %6h | %6b | %6b | %7b | %6b || %6h", clk, in, re, we, linesel, reset, out);
    {re, we, linesel, reset, clk} = 5'b00010;
    in = 8'h8f;
    #10;
    we = 1; linesel = 1;
    #10;
    we = 0;
    re = 1;
    #10;
    reset = 0;
    #5;
  end
endmodule
