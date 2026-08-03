`timescale 1ns/1ps

module not_gate_tb;

    // Testbench signals
    reg a;
    wire y;

    // Instantiate the DUT
    not_gate uut (
        .a(a),
        .y(y)
    );

    // Generate VCD file for GTKWave
    initial begin
        $dumpfile("not_gate.vcd");
        $dumpvars(0, not_gate_tb);
    end

    // Display values in terminal
    initial begin
        $display("Time(ns)\ta\ty");
        $monitor("%0t\t%b\t%b", $time, a, y);
    end

    // Toggle input every 10 ns for 200 ns
    initial begin
        a = 0;

        repeat (20) begin
            #10 a = ~a;
        end

        #10 $finish;
    end

endmodule
