`timescale 1ns/1ps

module xor_gate_tb;

    // Testbench signals
    reg a;
    reg b;
    wire y;

    // Instantiate the DUT
    xor_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Generate VCD file for GTKWave
    initial begin
        $dumpfile("xor_gate.vcd");
        $dumpvars(0, xor_gate_tb);
    end

    // Display simulation results
    initial begin
        $display("Time(ns)\ta\tb\ty");
        $monitor("%0t\t\t%b\t%b\t%b", $time, a, b, y);
    end

    // Apply all input combinations (40 ns total)
    initial begin
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule
