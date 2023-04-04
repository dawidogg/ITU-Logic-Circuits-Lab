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