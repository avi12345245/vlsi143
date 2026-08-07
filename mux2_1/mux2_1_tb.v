`timescale 1ns/1ps

module mux2_1_tb;

    reg a, b, s0;
    wire y;

    // Instantiate the DUT
    mux2_1 uut (
        .a(a),
        .b(b),
        .s0(s0),
        .y(y)
    );

    // Generate VCD file
    initial begin
        $dumpfile("mux2_1.vcd");
        $dumpvars(0, mux2_1_tb);
    end

    // Display outputs
    initial begin
        $display("Time\ta\tb\tsel\ty");
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, a, b, s0, y);
    end

    // Test vectors
    initial begin
        a=0; b=0; s0=0; #10;
        a=0; b=1; s0=0; #10;
        a=1; b=0; s0=0; #10;
        a=1; b=1; s0=0; #10;

        a=0; b=0; s0=1; #10;
        a=0; b=1; s0=1; #10;
        a=1; b=0; s0=1; #10;
        a=1; b=1; s0=1; #10;

        $finish;
    end

endmodule
