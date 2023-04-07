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
module sync_up_counter(input clk, input reset, output [3:0] out);
    JK_FF jk1(.J(1), .K(1), .reset(reset | (out[0]&out[1]&out[2]&out[3])), .clk(clk), .Q(out[0]));
    JK_FF jk2(.J(out[0]), .K(out[0]), .reset(reset | (out[0]&out[1]&out[2]&out[3])), .clk(clk), .Q(out[1]));
    JK_FF jk3(.J(out[0]&out[1]), .K(out[0]&out[1]), .reset(reset | (out[0]&out[1]&out[2]&out[3])), .clk(clk), .Q(out[2]));
    JK_FF jk4(.J(out[0]&out[1]&out[2]), .K(out[0]&out[1]&out[2]), .reset(reset | (out[0]&out[1]&out[2]&out[3])), .clk(clk), .Q(out[3]));
endmodule

//PART6 TB
module sync_up_countr_tb();
    //Inputs
    reg clk, reset;
    //Output
    wire [3:0] out;
    
    sync_up_counter uut (.clk(clk), .reset(reset), .out(out));
    
    initial clk = 1;
    always #5 clk = ~clk;
	
    initial begin
        // Reset
        reset = 1; #1;
        // Release reset
        reset = 0;
    end
endmodule

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
