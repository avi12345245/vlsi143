`timescale 1ns/1ps

module dmux4_1_tb;

    wire y;
    reg [1:0] sel;
    reg [3:0] i;

    // Instantiate DUT
    dmux4_1 uut (
        .i(i),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Create waveform
        $dumpfile("dmux4_1.vcd");
        $dumpvars(0, dmux4_1_tb);

        // Display
        $monitor("Time=%0t | i=%b | sel=%b | y=%b",
                 $time, i, sel, y);

        // i = 0
        i = 4'b0000; sel = 2'b00; #10;
        i = 4'b0000; sel = 2'b01; #10;
        i = 4'b0000; sel = 2'b10; #10;
        i = 4'b0000; sel = 2'b11; #10;

        // i = 1
        i = 4'b0001; sel = 2'b00; #10;
        i = 4'b0001; sel = 2'b01; #10;
        i = 4'b0001; sel = 2'b10; #10;
        i = 4'b0001; sel = 2'b11; #10;

        $finish;
    end

endmodule