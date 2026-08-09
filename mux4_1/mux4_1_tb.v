`timescale 1ns/1ps

module mux4_1_tb;

    reg I0;
    reg I1;
    reg I2;
    reg I3;
    reg [1:0] sel;

    wire y;

    // Instantiate DUT
    mux4_1 uut (
        .I0(I0),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .sel(sel),
        .y(y)
    );

    // Generate VCD for GTKWave
    initial begin
        $dumpfile("mux4_1.vcd");
        $dumpvars(0, mux4_1_tb);
    end

    // Display values
    initial begin
        $display("Time\tI0 I1 I2 I3\tsel\ty");
        $monitor("%0t\t%b  %b  %b  %b\t%b\t%b",
                 $time, I0, I1, I2, I3, sel, y);
    end

    // Test all combinations
    initial begin

        // sel = 00 -> y should follow I0
        I0=0; I1=0; I2=0; I3=0; sel=2'b00; #10;
        I0=1; I1=0; I2=0; I3=0; sel=2'b00; #10;
        I0=0; I1=1; I2=0; I3=0; sel=2'b00; #10;
        I0=1; I1=1; I2=0; I3=0; sel=2'b00; #10;

        // sel = 01 -> y should follow I1
        I0=0; I1=0; I2=0; I3=0; sel=2'b01; #10;
        I0=0; I1=1; I2=0; I3=0; sel=2'b01; #10;
        I0=0; I1=0; I2=1; I3=0; sel=2'b01; #10;
        I0=0; I1=1; I2=1; I3=0; sel=2'b01; #10;

        // sel = 10 -> y should follow I2
        I0=0; I1=0; I2=0; I3=0; sel=2'b10; #10;
        I0=0; I1=0; I2=1; I3=0; sel=2'b10; #10;
        I0=1; I1=0; I2=0; I3=0; sel=2'b10; #10;
        I0=1; I1=0; I2=1; I3=0; sel=2'b10; #10;

        // sel = 11 -> y should follow I3
        I0=0; I1=0; I2=0; I3=0; sel=2'b11; #10;
        I0=0; I1=0; I2=0; I3=1; sel=2'b11; #10;
        I0=1; I1=0; I2=0; I3=0; sel=2'b11; #10;
        I0=1; I1=1; I2=1; I3=1; sel=2'b11; #10;

        $finish;
    end

endmodule
