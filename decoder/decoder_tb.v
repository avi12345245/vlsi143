`timescale 1ns/1ps

module decoder2_4_tb;

    reg [1:0] i;
    wire [3:0] y;

    decoder uut (
        .i(i),
        .y(y)
    );

    integer k;

    initial begin
        $dumpfile("decoder.vcd");
        $dumpvars(0, decoder2_4_tb);

        $display("--------------------------------");
        $display("  i   |   y");
        $display("--------------------------------");

        for (k = 0; k < 4; k = k + 1) begin
            i = k;
            #10;
            $display(" %02b  |  %04b", i, y);
        end

        $display("--------------------------------");

        $finish;
    end

endmodule