`timescale 1ns/1ps

module CLA_4_tb;

    reg  [3:0] A;
    reg  [3:0] B;
    reg        Cin;

    wire [3:0] S;
    wire       Cout;

    reg [4:0] expected;

    integer i;

    // Instantiate CLA
    CLA_4 uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin

        $dumpfile("CLA_4.vcd");
        $dumpvars(0, CLA_4_tb);

        $display("------------------------------------------------");
        $display(" A     B    Cin |  S    Cout | Expected | Result");
        $display("------------------------------------------------");

        for (i = 0; i < 10; i = i + 1) begin

            // Generate random 4-bit numbers
            A   = $random & 4'b1111;
            B   = $random & 4'b1111;
            Cin = $random & 1'b1;

            #10;

            // Calculate expected result
            expected = A + B + Cin;

            // Check CLA output
            if ({Cout, S} !== expected) begin
                $display("%b  %b    %b  | %b    %b   |  %b    | FAIL",
                         A, B, Cin, S, Cout, expected);
            end
            else begin
                $display("%b  %b    %b  | %b    %b   |  %b    | PASS",
                         A, B, Cin, S, Cout, expected);
            end

        end

        $display("------------------------------------------------");

        $finish;
    end

endmodule