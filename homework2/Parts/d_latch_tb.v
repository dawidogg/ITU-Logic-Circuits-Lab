`include "part_1_3_6_7.v"

module d_latch_tb;
  reg d, e;
  wire q, q_neg;
  d_latch uut(d, e, q, q_neg);

  initial begin
    $display("Testing D Latch...");
    $display("d e | q q_neg");
    $monitor("%b %b | %b   %b", d, e, q, q_neg);
    e = 0; d = 0; #5;
    d = 1; #5;
    e = 1; #5;
    e = 0; #5;
    d = 0; #5;
    e = 1; #5;
    e = 0; #5;
  end
endmodule
