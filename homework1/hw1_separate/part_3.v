module part_3(out, a, b, c, d);
    output out;
    input a, b, c, d;
    wire not_a, not_b, not_d;
    wire[2:0] minterms;
    NAND nand0(not_a, a, a);
    NAND nand1(not_b, b, b);
    NAND nand2(not_d, d, d);
    NAND_3 nand3(minterms[0], {not_a, b, c});
    NAND_3 nand4(minterms[1], {a, c, d});
    NAND nand5(minterms[2], not_b, not_d);
    NAND_3 nand6(out, minterms);
endmodule

module part_3_tb;
    reg[3:0] counter;
    wire a, b, c, d;
    assign {a, b, c, d} = counter;

    part_3 uut(out, a, b, c, d);
    parameter delay = 5;

    initial begin
        $display("abcd    f1");
        $monitor("%b -> %b", counter, out);
        counter = 4'b0;
        repeat(15) #delay counter = counter+1; 

    end    
endmodule;