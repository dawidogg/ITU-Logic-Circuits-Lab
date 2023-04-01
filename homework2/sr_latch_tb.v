`include "part_1_3_6.v"

module sr_latch_tb;
  reg s, r;
  wire q, q_neg;
  sr_latch uut(s, r, q, q_neg);

  initial begin
    $display("Testing SR Latch...");
    $display("s r | q q_neg");
    $monitor("%b %b | %b   %b", s, r, q, q_neg);
    s = 1; r = 0; #5; 
    s = 0; #5;
    r = 1; #5;
    r = 0; #5;
    s = 1; #5;
    r = 1; #5;
  end
endmodule
