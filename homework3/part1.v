module buffer(
  input in,
  input e,
  output out
);
  assign out = (e)? in : 1'bz;
endmodule

module part1(
  input[7:0] data1,
  input[7:0] data2,
  input select,
  output[7:0] out
);
  buffer buf1[7:0](data1, {8{~select}}, out);
  buffer buf2[7:0](data2, {8{select}}, out);
endmodule

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
