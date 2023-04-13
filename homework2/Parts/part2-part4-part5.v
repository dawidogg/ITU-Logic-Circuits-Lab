//Part 2

module sr_latch_E_nand(S, R, E, Q, Q_N);
    input S, R, E;
    output Q, Q_N;
    
    wire S_E, R_E;
    
    NAND nand0(S, E, S_E);
    NAND nand1(R, E, R_E);
    NAND nand2(S_E, Q_N, Q);
    NAND nand3(Q, R_E, Q_N);
    
endmodule

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

// PART4
module JK_FF(input J, input K, input reset, input clk, output reg Q, output reg Q_N);
    //Always block triggered by clk, reset
    always @(posedge clk, posedge reset) begin
    //Reset condition
    if (reset) begin
      Q <= 0; 
      Q_N <= 1;
    end 
	else begin
		case ({J,K}) 
		2'b11: begin //Toggle
			   Q <= ~Q;
			   Q_N <= ~Q_N;
			   end
		2'b10: begin //Set
			   Q <= 1;
			   Q_N <= 0;
			   end
		2'b01 : begin //Reset to 0
			   Q <= 0;
			   Q_N <= 1;
			   end
		2'b00:  begin // Preserve
			   Q <= Q;
			   Q_N <= Q_N;
		       end
		endcase
    end
    end
endmodule

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

//PART5
module async_up_counter(input clk, input reset, output [3:0] out);
    JK_FF jk1(.J(1), .K(1), .reset(reset | (out[0]&out[1]&out[2]&out[3])), .clk(~clk), .Q(out[0]));
    JK_FF jk2(.J(1), .K(1), .reset(reset), .clk(~out[0]), .Q(out[1]));
    JK_FF jk3(.J(1), .K(1), .reset(reset), .clk(~out[1]), .Q(out[2]));
    JK_FF jk4(.J(1), .K(1), .reset(reset), .clk(~out[2]), .Q(out[3]));
endmodule

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