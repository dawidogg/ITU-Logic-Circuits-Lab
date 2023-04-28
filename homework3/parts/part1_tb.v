`include "part1.v"

module bus_8_tb;
  reg[7:0] data1, data2;
  reg select;
  wire[7:0] out;
  part1 uut(data1, data2, select, out);
  
  initial begin
    $dumpvars;
    $display("%6s | %6s | %6s | %6s", "Data 1", "Data 2", "Select", "Output");
    $display({36{"-"}});
    $monitor("%6h | %6h | %6h | %6h", data1, data2, select, out);
    {data1, data2} = {8'h9a, 8'hc0};
    select = 0;
    #5 select = 1;
    #5 {data1,data2} = {8'h52, 8'h6f};  
    #5 select = 0;
    #5;
    
  end
endmodule