// Part 1 Simulation
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

// Part 2 Simulation
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

// Part 3 Simulation
module part3_tb;
  reg[7:0] in;
  reg clk, re, we, reset, linesel;
  wire[7:0] out;
  part3 uut(clk, in, re, we, reset, linesel, out);

  initial repeat(8) #5 clk = ~clk;

  initial begin
    $dumpvars;
    $display("%6s | %6s | %6s | %6s | %7s | %6s || %6s", "Clock", "Input", "Read", "Write", "LineSel", "Reset", "Output");
    $display({65{"-"}});
    $monitor("%6b | %6h | %6b | %6b | %7b | %6b || %6h", clk, in, re, we, linesel, reset, out);
    {re, we, linesel, reset, clk} = 5'b00010;
    in = 8'h8f;
    #10;
    we = 1; linesel = 1;
    #10;
    we = 0;
    re = 1;
    #10;
    reset = 0;
    #5;
  end
endmodule

// Part 4 Simulation
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
    repeat(8) #10 adress = adress + 1;
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
      adress = adress + 1;
      in = in + 1;
      #10;
    end
    we = 0;
    printContents;
    reset = 0;
    printContents;
  end

endmodule


// Part 5 Simulation
module part5_tb();
    reg clk;
    reg[7:0] in;
    reg[4:0] a;
    reg reset;
    reg re;
    reg we;
    wire[7:0] out;

    part5 uut(clk, in, a, reset, re, we, out);
    
    // Clock Signal
    initial clk = 0;
    always  #10 clk = ~clk;
  
    initial begin
        // Reset all lines
        in = 15; a = 0; reset = 0; re = 1; we = 0; #10; reset = 1; #1;  
        in = 15; a = 8; reset = 0; re = 1; we = 0; #10; reset = 1; #1;
        in = 15; a = 16; reset = 0; re = 1; we = 0; #10; reset = 1; #1;
        in = 15; a = 24; reset = 0; re = 1; we = 0; #10;
        // Write 25 to Address 30
        in = 25; a = 30; reset = 0; re = 1; we = 1; #20;
        // Write 15 to Address 20
        in = 15; a = 20; reset = 0; re = 1; we = 1; #20;
        // Read Address 12
        in = 15; a = 12; reset = 0; re = 1; we = 0; #20;
        // Write 18 to Address 10
        in = 18; a = 10; reset = 0; re = 1; we = 1; #20;
        // Read address 15
        in = 1; a = 15; reset = 0; re = 1; we = 0; #20;
        // Read address 30
        in = 1; a = 30; reset = 0; re = 1; we = 0; #20;
        // Read address 10
        in = 1; a = 10; reset = 0; re = 1; we = 0; #20;
        $finish;
    end
endmodule

// Part 6 Simulation
module part6_tb();
    reg clk;
    reg[31:0] in;
    reg[4:0] a;
    reg reset;
    reg re;
    reg we;
    wire[31:0] out;
  
    part6 uut(clk, in, a, reset, re, we, out);
    
    // Clock signal
    initial clk = 0;
    always  #10 clk = ~clk;
    
    // To validate the results by comparing with part5. We use same inputs to check if the results are same.
    initial begin
        // Reset all lines
        in = 15; a = 0; reset = 0; re = 1; we = 0; #10; reset = 1; #1;  
        in = 15; a = 8; reset = 0; re = 1; we = 0; #10; reset = 1; #1;
        in = 15; a = 16; reset = 0; re = 1; we = 0; #10; reset = 1; #1;
        in = 15; a = 24; reset = 0; re = 1; we = 0; #10;
        // Write 25 to Address 30
        in = 25; a = 30; reset = 0; re = 1; we = 1; #20;
        // Write 15 to Address 20
        in = 15; a = 20; reset = 0; re = 1; we = 1; #20;
        // Read Address 12
        in = 15; a = 12; reset = 0; re = 1; we = 0; #20;
        // Write 18 to Address 10
        in = 18; a = 10; reset = 0; re = 1; we = 1; #20;
        // Read address 15
        in = 1; a = 15; reset = 0; re = 1; we = 0; #20;
        // Read address 30
        in = 1; a = 30; reset = 0; re = 1; we = 0; #20;
        // Read address 10
        in = 1; a = 10; reset = 0; re = 1; we = 0; #20;
        $finish;
    end
endmodule