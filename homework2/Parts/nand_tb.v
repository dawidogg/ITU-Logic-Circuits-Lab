`include "part_1_3_6_7.v"

module nand_tb;
  reg a, b;
  wire out;
  NAND uut(a, b, out);
  
  initial begin
    $display("Testing NAND...");
    $display("a b | a~&b");
    $monitor("%b %b | %b", a, b, out);
    {a, b} = 2'b00; #5;
    {a, b} = {a, b} + 1; #5;
    {a, b} = {a, b} + 1; #5;
    {a, b} = {a, b} + 1; #5;
  end
endmodule