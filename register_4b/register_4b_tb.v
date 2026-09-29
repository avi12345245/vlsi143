`timescale 1ns/1ps

module register_4b_tb;

    // Inputs
    reg clk;
    reg load;
    reg [3:0] data_in;

    // Output
    wire [3:0] data_out;

    // Instantiate register
    register_4b uut (
        .clk(clk),
        .load(load),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Waveform generation
        $dumpfile("register_4b_tb.vcd");
        $dumpvars(0, register_4b_tb);

        // Monitor
        $monitor("Time=%0t | clk=%b load=%b data_in=%b | data_out=%b",
                 $time, clk, load, data_in, data_out);

        // Initial values
        clk = 0;
        load = 0;
        data_in = 4'b0000;

        // -------------------------
        // Test 1: Load 1010
        // -------------------------
        #2;
        load = 1;
        data_in = 4'b1010;

        // Wait for clock edge
        #10;

        // -------------------------
        // Test 2: Load 1100
        // -------------------------
        data_in = 4'b1100;

        #10;

        // -------------------------
        // Test 3: Hold 1100
        // -------------------------
        load = 0;
        data_in = 4'b0011;

        #10;

        // -------------------------
        // Test 4: Hold again
        // -------------------------
        data_in = 4'b1111;

        #10;

        // -------------------------
        // Test 5: Load 0110
        // -------------------------
        load = 1;
        data_in = 4'b0110;

        #10;

        // -------------------------
        // Test 6: Hold 0110
        // -------------------------
        load = 0;
        data_in = 4'b1001;

        #10;

        $finish;

    end

endmodule