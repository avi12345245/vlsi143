`timescale 1ns/1ps

module sr_ff_tb;

    reg s, r, clk;
    wire q, qbar;

    integer i;

    sr_ff uut (
        .s(s),
        .r(r),
        .clk(clk),
        .q(q),
        .qbar(qbar)
    );

    // Clock
    always #5 clk = ~clk;

    initial begin
        $dumpfile("sr_ff_tb.vcd");
        $dumpvars(0, sr_ff_tb);

        clk = 0;
        s = 0;
        r = 0;

        $display("Time | CLK | S R | Q Qbar");
        $display("---------------------------");

        $monitor("%4t |  %b  | %b %b | %b   %b",
                 $time, clk, s, r, q, qbar);

        // 16 random S/R combinations
        for (i = 0; i < 16; i = i + 1) begin

            s = $random & 1'b1;
            r = $random & 1'b1;

            #10;

        end

        $finish;
    end

endmodule