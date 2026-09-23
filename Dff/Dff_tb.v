`timescale 1ns/1ps

module Dff_tb;
    reg d, clk;
    wire q, qbar;

    dff uut(.d(d), .clk(clk), .q(q), .qbar(qbar));

    always #5 clk = ~clk;

    initial begin
        $dumpfile("Dff.vcd");
        $dumpvars(0, Dff_tb);
    end

    initial begin
        // Test sequence
        clk = 0;
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;
        $finish;
    end

    initial begin
        $monitor("Time: %0t | d: %b | clk: %b | q: %b | qbar: %b", $time, d, clk, q, qbar);
    end
endmodule