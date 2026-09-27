`timescale 1ns/1ps

module comp4b_tb;

    reg [3:0] a;
    reg [3:0] b;

    wire G;
    wire E;
    wire L;

    integer i;
    integer j;

    comp4b uut (
        .a(a),
        .b(b),
        .G(G),
        .E(E),
        .L(L)
    );

    initial begin

        $dumpfile("comp4b_tb.vcd");
        $dumpvars(0, comp4b_tb);

        $display("-----------------------------------------");
        $display("   A     B   | G  E  L | Result");
        $display("-----------------------------------------");

        for (i = 0; i < 16; i = i + 1) begin

            for (j = 0; j < 16; j = j + 1) begin

                a = i;
                b = j;

                #10;

                if ((i > j) && (G == 1 && E == 0 && L == 0))
                    $display("  %04b  %04b | %b  %b  %b | PASS", a, b, G, E, L);

                else if ((i == j) && (G == 0 && E == 1 && L == 0))
                    $display("  %04b  %04b | %b  %b  %b | PASS", a, b, G, E, L);

                else if ((i < j) && (G == 0 && E == 0 && L == 1))
                    $display("  %04b  %04b | %b  %b  %b | PASS", a, b, G, E, L);

                else
                    $display("  %04b  %04b | %b  %b  %b | FAIL", a, b, G, E, L);

            end
        end

        $display("-----------------------------------------");
        $finish;

    end

endmodule