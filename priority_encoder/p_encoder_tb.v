`timescale 1ns/1ps

module p_encoder_tb;

    reg  [3:0] i;
    wire [1:0] y;

    integer k;

    p_encoder uut (
        .i(i),
        .y(y)
    );

    initial begin

        $dumpfile("p_encoder.vcd");
        $dumpvars(0, p_encoder_tb);

        $display("--------------------------------");
        $display("   i    |   y");
        $display("--------------------------------");

        for (k = 0; k < 16; k = k + 1) begin

            i = k;
            #10;

            $display("  %04b   |  %02b", i, y);

        end

        $display("--------------------------------");

        $finish;
    end

endmodule