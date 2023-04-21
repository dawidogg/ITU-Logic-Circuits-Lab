`include "part1.v"

module part2_tb;
  reg[7:0] data1, data2;
  reg select;
  wire[7:0] out1, out2;
  part2 uut(data1, data2, select, out1, out2);

  initial begin
    $dumpvars;
    $display("%6s | %6s | %6s | %8s | %8s", "Data 1", "Data 2", "Select", "Output 1", "Output 2");
    $display({48{"-"}});
    $monitor("%6h | %6h | %6h | %8h | %8h", data1, data2, select, out1, out2);
    {data1, data2} = {8'h9a, 8'hc0};
    select = 0;
    #5 select = 1;
    #5 {data1,data2} = {8'h52, 8'h6f};  
    #5 select = 0;
    #5;
  end
endmodule