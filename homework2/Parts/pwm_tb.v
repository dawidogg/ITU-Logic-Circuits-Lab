`include "part_1_3_6_7.v"

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
