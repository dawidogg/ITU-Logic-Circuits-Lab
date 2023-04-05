`include "part_1_3_6_7.v"

module d_ff_negedge_tb;
  reg d, clk;
  wire q, q_neg;
  d_ff_negedge uut(d, clk, q, q_neg);

  initial
    repeat(7) #5 clk = ~clk;
  initial begin
    $display("Testing negative edge triggered D flip-flop...");
    $display("d clk | q q_neg");
    $monitor("%b    %b | %b   %b", d, clk, q, q_neg);
    clk = 1;
    d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 d = 0;
  end
endmodule