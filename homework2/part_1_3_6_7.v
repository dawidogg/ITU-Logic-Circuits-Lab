// Part 1
module NAND(
  input a,
  input b,
  output out
);
  assign out = ~(a & b);
endmodule

module sr_latch (
  input s, 
  input r,
  output q,
  output q_neg
);
  NAND n1(~s, q_neg, q);
  NAND n2(~r, q, q_neg);
endmodule

// Part 3
module d_latch (
  input d,
  input e,
  output q,
  output q_neg
);
  wire s_neg, r_neg, d_neg;
  NAND n0(d, d, d_neg);
  NAND n1(d, e, s_neg);
  NAND n2(d_neg, e, r_neg);
  NAND n3(s_neg, q_neg, q);
  NAND n4(r_neg, q, q_neg);
endmodule

module d_ff_negedge (
  input d,
  input clk,
  output q,
  output q_neg
);
  wire d_middle, clk_neg;
  NAND n1(clk, clk, clk_neg);
  d_latch dl1(d, clk, d_middle, );
  d_latch dl2(d_middle, clk_neg, q, q_neg);
endmodule

// Part 6
/*module synch_up_counter (
  input clk,
  output[3:0] a
);
  jk_ff jk0(.clk(clk), .q(a[0]));
  assign {jk0.j, jk0.k} = 2'b11;
  jk_ff jk1(.clk(clk), .j(a[0]), .k(a[0]), .q(a[1]));
  jk_ff jk2(.clk(clk), .j(a[1] & a[0]), .k(a[1] & a[0]), .q(a[2]));
  jk_ff jk3(.clk(clk), .j(a[2] & a[1]), .k(a[2] & a[1]), .q(a[3]));
endmodule
*/

module mux_2_1(
  input i0,
  input i1,
  input s,
  output out
);
  assign out = (s == 1'b1) ? i1 : i0; 
endmodule

// Part 7
module pwm(
  input[15:0] in,
  input clk,
  input load,
  output q
);
  wire[15:0] d_input;
  wire[15:0] d_output;
  
  mux_2_1 mx[15:0]({d_output[0], d_output[15:1]}, in, {16{load}}, d_input[15:0]);
  d_ff_negedge d_ff[15:0](d_input[15:0], ~clk, d_output[15:0], );
  assign q = d_input[15];
endmodule
