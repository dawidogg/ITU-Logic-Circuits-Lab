//NAND TB
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

//PART 1 TB
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

//PART 2 TB
module sr_latch_E_nand_tb();

    reg S, R, E;
    wire Q, Q_N;
    
    sr_latch_E_nand uut(S, R, E, Q, Q_N);
    
    initial begin
        S = 0; R = 1; E = 1; #20;
        S = 0; R = 0; E = 1; #20;
        S = 1; R = 0; E = 1; #20;
        S = 0; R = 0; E = 0; #20;
        S = 0; R = 1; E = 1; #20;
        S = 1; R = 0; E = 0; #20;
        S = 0; R = 1; E = 0; #20;
        S = 0; R = 1; E = 1; #20;
        S = 1; R = 1; E = 0; #20;
        S = 1; R = 1; E = 1; #20;
        $finish;
    end
endmodule

//PART 3 TB
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

//PART 4 TB
module JK_FF_tb;
  // Inputs
  reg J, K, reset, clk;

  // Outputs
  wire Q, Q_N;

  JK_FF uut (.J(J), .K(K), .reset(reset), .clk(clk), .Q(Q), .Q_N(Q_N));

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    // Reset active
    J = 1; K = 1; reset = 1; #10;
    // Release reset
    reset = 0;
    // Test
    J = 1; K = 1; #10;
    J = 1; K = 0; #10;
    J = 0; K = 1; #10;
    J = 0; K = 0; #10;
	J = 1; K = 1; #10;
    $finish;
  end
endmodule

//PART 5 TB
module async_up_counter_tb();
    //Inputs
    reg clk, reset;
    //Output
    wire [3:0] out;
    
    async_up_counter uut (.clk(clk), .reset(reset), .out(out));
    
    initial clk = 0;
    always #5 clk = ~clk;
	
    initial begin
        // Reset
        reset = 1; #1;
        // Release reset
        reset = 0;
      end
endmodule

//PART 6 TB
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

//MUX_2_1 TB
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
    repeat(7) #5 {a, b, s} = {a,b,s} + 1;
  end
endmodule

//PART 7 TB
module pwm_tb_v;
  reg[15:0] in;
  reg clk, load;
  wire out;
  pwm uut(in, clk, load, out);

  task displayHead;
    $display("%32s %6s %6s %6s", "Input", "Clock", "Load", "Output");
  endtask

  initial begin
    $monitor("%32b %6b %6b %6b", in, clk, load, out);
    
    $display("1/2 of clock");
    displayHead;
    in = 32'b1010101010101010;
    clk = 0;
    load = 1;
    #5;
    clk = 1;
    #5;
    load = 0;
    repeat (32) #5 clk = ~clk;


    #20;

    $display("1/4 of clock");
    displayHead;
    in = 32'b1100110011001100;
    clk = 0;
    load = 1;
    #5;
    clk = 1;
    #5;
    load = 0;
    repeat (32) #5 clk = ~clk;

    #20;

    $display("1/8 of clock");
    displayHead;
    in = 32'b1111000011110000;
    clk = 0;
    load = 1;
    #5;
    clk = 1;
    #5;
    load = 0;
    repeat (32) #5 clk = ~clk;

    #20;
    $display("1/7 pulse-gap");
    displayHead;
    in = 32'b1000000010000000;
    clk = 0;
    load = 1;
    #5;
    clk = 1;
    #5;
    load = 0;
    repeat (32) #5 clk = ~clk;

    #20;
    $display("3/13 pulse-gap");
    displayHead;
    in = 32'b1110000000000000;
    clk = 0;
    load = 1;
    #5;
    clk = 1;
    #5;
    load = 0;
    repeat (32) #5 clk = ~clk;

    #20;
    $display("11/5 pulse-gap");
    displayHead;
    in = 32'b1111111111100000;
    clk = 0;
    load = 1;
    #5;
    clk = 1;
    #5;
    load = 0;
    repeat (32) #5 clk = ~clk;

  end

endmodule

