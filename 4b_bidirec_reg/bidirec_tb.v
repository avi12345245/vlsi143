`timescale 1ns/1ps

module bidirec_reg_tb;

    reg [3:0] in;
    reg clk;
    reg [1:0] ctrl;

    wire [3:0] out;

    integer i;

    // DUT
    b4_bidirec_reg uut (
        .in(in),
        .clk(clk),
        .out(out),
        .ctrl(ctrl)
    );

    // Clock
    always #5 clk = ~clk;

    initial begin

        // Waveform
        $dumpfile("bidirec_reg_tb.vcd");
        $dumpvars(0, bidirec_reg_tb);

        // Initial values
        clk = 0;
        in = 4'b0000;
        ctrl = 2'b11;

        $display("====================================================");
        $display("       4-BIT BIDIRECTIONAL REGISTER TEST");
        $display("====================================================");
        $display(" Time | CTRL |   IN   |   OUT  ");
        $display("----------------------------------------------------");

        $monitor("%4t  |  %02b  |  %04b   |  %04b",
                 $time, ctrl, in, out);

        // =================================================
        // TEST 1: PARALLEL LOAD
        // ctrl = 00
        // Test all 16 possible input combinations
        // =================================================

        ctrl = 2'b00;

        for (i = 0; i < 16; i = i + 1) begin
            in = i;
            #10;
        end


        // =================================================
        // TEST 2: SHIFT RIGHT
        // ctrl = 01
        // =================================================

        ctrl = 2'b01;
        in = 4'b0000;

        // Load starting value
        ctrl = 2'b00;
        in = 4'b1011;
        #10;

        // Shift right several times
        ctrl = 2'b01;

        #10;
        #10;
        #10;
        #10;
        #10;


        // =================================================
        // TEST 3: SHIFT RIGHT FROM DIFFERENT VALUES
        // =================================================

        ctrl = 2'b00;
        in = 4'b1111;
        #10;

        ctrl = 2'b01;
        #10;
        #10;
        #10;
        #10;


        ctrl = 2'b00;
        in = 4'b1001;
        #10;

        ctrl = 2'b01;
        #10;
        #10;
        #10;


        // =================================================
        // TEST 4: SHIFT LEFT
        // ctrl = 10
        // =================================================

        ctrl = 2'b00;
        in = 4'b1011;
        #10;

        ctrl = 2'b10;

        #10;
        #10;
        #10;
        #10;
        #10;


        // =================================================
        // TEST 5: SHIFT LEFT FROM DIFFERENT VALUES
        // =================================================

        ctrl = 2'b00;
        in = 4'b1111;
        #10;

        ctrl = 2'b10;

        #10;
        #10;
        #10;
        #10;


        ctrl = 2'b00;
        in = 4'b0101;
        #10;

        ctrl = 2'b10;

        #10;
        #10;
        #10;


        // =================================================
        // TEST 6: HOLD
        // ctrl = 11
        // =================================================

        ctrl = 2'b00;
        in = 4'b1100;
        #10;

        ctrl = 2'b11;

        // Change input but output should remain 1100
        in = 4'b0000;
        #10;

        in = 4'b1111;
        #10;

        in = 4'b0101;
        #10;

        in = 4'b0011;
        #10;


        // =================================================
        // TEST 7: MIXED OPERATIONS
        // =================================================

        // Load
        ctrl = 2'b00;
        in = 4'b1101;
        #10;

        // Right shift
        ctrl = 2'b01;
        #10;
        #10;

        // Hold
        ctrl = 2'b11;
        #10;
        #10;

        // Left shift
        ctrl = 2'b10;
        #10;
        #10;

        // Load another value
        ctrl = 2'b00;
        in = 4'b0110;
        #10;

        // Left shift
        ctrl = 2'b10;
        #10;
        #10;

        // Right shift
        ctrl = 2'b01;
        #10;
        #10;

        // Hold
        ctrl = 2'b11;
        #20;


        // =================================================
        // END
        // =================================================

        $display("====================================================");
        $display("                  TEST COMPLETE");
        $display("====================================================");

        $finish;

    end

endmodule