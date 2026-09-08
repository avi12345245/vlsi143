module CLA_4 (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] S,
    output Cout
);
wire [3:0] p,g;
wire [4:0] c;
assign c[0] = Cin;

assign p = A ^ B; // Propogate
assign g = A & B; // Generate

// Carry Lookahead Logic
assign c[1] = g[0] | (p[0] & Cin);
assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & Cin);
assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & Cin);
assign c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & Cin);

// Sum Calculation
assign S[0] = p[0] ^ c[0];
assign S[1] = p[1] ^ c[1];
assign S[2] = p[2] ^ c[2];
assign S[3] = p[3] ^ c[3];
assign Cout = c[4];
endmodule