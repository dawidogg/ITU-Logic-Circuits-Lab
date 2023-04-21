`include "part1.v"

module part4_tb;
  reg[7:0] in;
  reg[2:0] adress;
  reg cs, reset, re, we, clk;
  wire[7:0] out;
  part4 uut(clk, in, adress, cs, reset, re, we, out);

  initial repeat(32) #5 clk = ~clk;

  task printContents;
  begin
    cs = 1;
    re = 1;
    adress = 3'b000;
    repeat(8) #10 adress += 1;
  end
  endtask

  initial begin
    $dumpvars;
    $display("%6s | %6s | %6s | %6s | %6s | %6s | %6s || %6s", "Clock", "Input", "Adress", "CS", "Reset", "Read", "Write", "Output");
    $display({70{"-"}});
    $monitor("%6b | %6h | %6d | %6b | %6b | %6b | %6b || %6h", clk, in, adress, cs, reset, re, we, out);
    {clk, cs, we, re, reset} = 5'b01101;
    in = 8'h0a;
    adress = 3'b000;    
    #10;
    repeat(7) begin
      adress += 1;
      in += 1;
      #10;
    end
    we = 0;
    printContents;
    reset = 0;
    printContents;
  end

endmodule
