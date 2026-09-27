`timescale 1ns/1ps

module encoder4_2_tb;

    reg [3:0] I;
    wire [1:0] Y;

    // Instantiate DUT
    encoder4_2 uut (
        .i(I),
        .y(Y)
    );

    initial begin
        // Waveform
        $dumpfile("encoder4_2.vcd");
        $dumpvars(0, encoder4_2_tb);

        // Display
        $monitor("Time=%0t | I=%b | Y=%b",
                 $time, I, Y);

        // Test all valid input combinations
        I = 4'b0001; #10;   // I0 = 1 -> Y = 00
        I = 4'b0010; #10;   // I1 = 1 -> Y = 01
        I = 4'b0100; #10;   // I2 = 1 -> Y = 10
        I = 4'b1000; #10;   // I3 = 1 -> Y = 11

        $finish;
    end

endmodule