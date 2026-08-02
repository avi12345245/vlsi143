`timescale 1ns/1ps

module or_gate_tb;

    // Testbench signals
    reg a;
    reg b;
    wire y;

    // Instantiate the DUT (Device Under Test)
    or_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Generate VCD file for GTKWave
    initial begin
        $dumpfile("or_gate.vcd");
        $dumpvars(0, or_gate_tb);
    end

    // Apply test vectors
    initial begin
        $display("Time\t a b | y");
        $monitor("%0t\t %b %b | %b", $time, a, b, y);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule
