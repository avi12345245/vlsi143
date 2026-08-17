module FA_4 (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
);
wire c1, c2, c3;
full_adder D0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(s[0]), .cout(c1));
full_adder D1 (.a(a[1]), .b(b[1]), .cin(c1), .sum(s[1]), .cout(c2));
full_adder D2 (.a(a[2]), .b(b[2]), .cin(c2), .sum(s[2]), .cout(c3));
full_adder D3 (.a(a[3]), .b(b[3]), .cin(c3), .sum(s[3]), .cout(cout));
endmodule