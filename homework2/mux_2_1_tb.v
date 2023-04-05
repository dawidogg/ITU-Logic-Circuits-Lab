`include "part_1_3_6_7.v"

module mux_2_1_tb;
  reg a;
  reg b;
  reg s;
  wire out;
  mux_2_1 uut(a, b, s, out);
  initial begin
    $display("a, b, s, out");
    $monitor("%b %b %b %b", a, b, s, out);
    {a, b, s} = 3'b000;
    repeat(7) #5 {a, b, s} += 1;
  end
endmodule