`timescale 1ns/1ps

module FA_4_tb;

    reg [3:0] a;
    reg [3:0] b;
    reg cin;

    wire [3:0] s;
    wire cout;

    reg [4:0] expected;

    integer i, j;

    // Instantiate DUT
    FA_4 uut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
    );

    initial begin

        $dumpfile("FA_4_tb.vcd");
        $dumpvars(0, FA_4_tb);

        $display("Time | a    b    cin | sum  cout | expected | result");
        $display("---------------------------------------------------");

        cin = 0;

        // 8 x 8 = 64 test cases
        for (i = 0; i < 8; i = i + 1) begin
            a = i;

            for (j = 0; j < 8; j = j + 1) begin
                b = j;

                #10;

                expected = a + b + cin;

                if ({cout, s} !== expected) begin
                    $display("%4dns | %4b %4b   %b  | %4b   %b   | %5b   | FAIL",
                             $time, a, b, cin, s, cout, expected);
                    $finish;
                end
                else begin
                    $display("%4dns | %4b %4b   %b  | %4b   %b   | %5b   | PASS",
                             $time, a, b, cin, s, cout, expected);
                end
            end
        end

        $display("---------------------------------------------------");
        $display("All 64 tests passed.");

        $finish;
    end

endmodule