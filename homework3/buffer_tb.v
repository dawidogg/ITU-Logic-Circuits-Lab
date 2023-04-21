`include "part1.v"

module buffer_tb;
  reg in, e;
  buffer uut(in, e, out);
  
  initial begin
    $dumpvars;
    $display("%6s %6s | %6s", "Input", "Enable", "Output");
    $monitor("%6b %6b | %6b", in, e, out);
    #5 {in, e} = 2'b00;
    #5 {in, e} = 2'b01;
    #5 {in, e} = 2'b10;
    #5 {in, e} = 2'b11;
    #5;
  end
endmodule