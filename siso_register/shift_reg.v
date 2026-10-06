module shift_reg(in, clk, out);
    input in;
    input clk;
    output wire out;
    wire m1, m2, m3;
dff dff0(.d(in), .clk(clk), .q(m1), .qbar());
dff dff1(.d(m1), .clk(clk), .q(m2), .qbar());
dff dff2(.d(m2), .clk(clk), .q(m3), .qbar());
dff dff3(.d(m3), .clk(clk), .q(out), .qbar());
endmodule