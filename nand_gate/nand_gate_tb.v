`timescale 1ns/1ps

module nand_gate_tb;

    // Testbench signals
    reg a;
    reg b;
    wire y;

    // Instantiate the DUT
    nand_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Generate VCD file for GTKWave
    initial begin
        $dumpfile("nand_gate.vcd");
        $dumpvars(0, nand_gate_tb);
    end

    // Display values in terminal
    initial begin
        $display("Time(ns)\ta\tb\ty");
        $monitor("%0t\t\t%b\t%b\t%b", $time, a, b, y);
    end

    // Apply all input combinations
    initial begin
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule
