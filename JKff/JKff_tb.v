`timescale 1ns/1ps

module jkff_tb;

    reg j, k, clk;
    wire q, qbar;

    integer i;

    jkff uut (
        .j(j),
        .k(k),
        .clk(clk),
        .q(q),
        .qbar(qbar)
    );

    // Clock
    always #5 clk = ~clk;

    initial begin
        $dumpfile("jkff_tb.vcd");
        $dumpvars(0, jkff_tb);

        clk = 0;
        j = 0;
        k = 0;

        $display("Time | CLK | J K | Q Qbar");
        $display("---------------------------");

        $monitor("%4t |  %b  | %b %b | %b   %b",
                 $time, clk, j, k, q, qbar);

        // 16 random J/K combinations
        for (i = 0; i < 16; i = i + 1) begin

            j = $random & 1'b1;
            k = $random & 1'b1;

            #10;

        end

        $finish;
    end

endmodule