`timescale 1ns/1ps

module and_gate_tb;

reg A;
reg B;

wire Y;

and_gate uut (
    .A(A),
    .B(B),
    .Y(Y)
);

initial begin

    $dumpfile("wave.vcd");
    $dumpvars(0,and_gate_tb);

    A = 0; B = 0;
    #10;

    A = 0; B = 1;
    #10;

    A = 1; B = 0;
    #10;

    A = 1; B = 1;
    #10;

    $finish;

end

endmodule
