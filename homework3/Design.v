module buffer(
  input in,
  input e,
  output out
);
  assign out = (e)? in : 1'bz;
endmodule

// Part 1
module part1(
  input[7:0] data1,
  input[7:0] data2,
  input select,
  output[7:0] out
);
  buffer buf1[7:0](data1, {8{~select}}, out);
  buffer buf2[7:0](data2, {8{select}}, out);
endmodule

// Part 2
module part2(
  input[7:0] data1,
  input[7:0] data2,
  input select,
  output[7:0] out1,
  output[7:0] out2
);
  wire[7:0] bus;
  part1 drivers(data1, data2, select, bus);
  buffer buf1[7:0](bus, {8{~select}}, out1);
  buffer buf2[7:0](bus, {8{select}}, out2);
endmodule

// Part 3
module part3(
  input clk,
  input[7:0] in,
  input re,
  input we,
  input reset,
  input linesel,
  output[7:0] out
);
  reg[7:0] data;
  buffer buf1[7:0](data, {8{re & linesel}}, out);

  always @(posedge clk)
    if (linesel & we) data = in;

  always @(negedge reset) data = 8'b0;
endmodule

// Part 4
module part4(
  input clk,
  input[7:0] in,
  input[2:0] a,
  input cs,
  input reset,
  input re,
  input we,
  output[7:0] out
);
  wire[7:0] decoded_adress;
  assign decoded_adress = {
    (a[2] & a[1] & a[0]),
    (a[2] & a[1] & ~a[0]),
    (a[2] & ~a[1] & a[0]),
    (a[2] & ~a[1] & ~a[0]),
    (~a[2] & a[1] & a[0]),
    (~a[2] & a[1] & ~a[0]),
    (~a[2] & ~a[1] & a[0]),
    (~a[2] & ~a[1] & ~a[0])
  };
  part3 memory[7:0](clk, in, re, we, (reset & cs), (decoded_adress & {8{cs}}), out);
endmodule

// Part 5
module part5(
  input clk,
  input[7:0] in,
  input[4:0] a,
  input reset,
  input re,
  input we,
  output[7:0] out
);
  wire[3:0] chip_decode;
  
  assign chip_decode = {
    (a[4] & a[3]),
    (a[4] & ~a[3]),
    (~a[4] & a[3]),
    (~a[4] & ~a[3])};
    
    part4 memory[3:0](clk, in, a[2:0], chip_decode, reset, re, we, out);
  
endmodule

// Part 6
module part6(
  input clk,
  input[31:0] in,
  input[4:0] a,
  input reset,
  input re,
  input we,
  output[31:0] out
);
    wire[7:0] out0, out1, out2, out3;
  
    assign out = {out0, out1, out2, out3};
    
    part5 memory0(clk, in[31:24], a[4:0], reset, re, we, out0);
    part5 memory1(clk, in[23:16], a[4:0], reset, re, we, out1);
    part5 memory2(clk, in[15:8], a[4:0], reset, re, we, out2);
    part5 memory3(clk, in[7:0], a[4:0], reset, re, we, out3);
  
endmodule