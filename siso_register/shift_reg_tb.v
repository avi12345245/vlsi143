`timescale 1ns/1ps

module shift_reg_tb;

    // Inputs
    reg in;
    reg clk;

    // Output
    wire out;

    // Instantiate SISO shift register
    shift_reg uut (
        .in(in),
        .clk(clk),
        .out(out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Waveform
        $dumpfile("shift_reg.vcd");
        $dumpvars(0, shift_reg_tb);

        // Monitor
        $monitor("Time=%0t | clk=%b | in=%b | out=%b",
                 $time, clk, in, out);

        // Initialize
        clk = 0;
        in = 0;

        // Send 1
        #2;
        in = 1;
        #10;

        // Send 0
        in = 0;
        #10;

        // Send 1
        in = 1;
        #10;

        // Send 1
        in = 1;
        #10;

        // Keep input low
        in = 0;
        #20;

        $finish;
    end

endmodule