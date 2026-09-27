`timescale 1ns/1ps

module comp1b_tb;

    reg a;
    reg b;
    wire [2:0] y;

    comp1b uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin

        $dumpfile("comp1b_tb.vcd");
        $dumpvars(0, comp1b_tb);

        $display("--------------------------------");
        $display(" A  B | A>B  A=B  A<B");
        $display("--------------------------------");

        a = 0; b = 0;
        #10;
        $display(" %b  %b |  %b    %b    %b", a, b, y[0], y[1], y[2]);

        a = 0; b = 1;
        #10;
        $display(" %b  %b |  %b    %b    %b", a, b, y[0], y[1], y[2]);

        a = 1; b = 0;
        #10;
        $display(" %b  %b |  %b    %b    %b", a, b, y[0], y[1], y[2]);

        a = 1; b = 1;
        #10;
        $display(" %b  %b |  %b    %b    %b", a, b, y[0], y[1], y[2]);

        $display("--------------------------------");

        $finish;
    end

endmodule