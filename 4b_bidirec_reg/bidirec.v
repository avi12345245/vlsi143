module b4_bidirec_reg(in, clk, out, ctrl);
    input wire [3:0] in;
    input wire clk;
    input wire [1:0] ctrl;
    output wire [3:0] out;
wire m1, m2, m3, m4;
wire x2, x3;
assign x2 = 1'b0;
assign x3 = 1'b0;

dff dff0(.d(m1), .clk(clk), .q(out[0]), .qbar());
dff dff1(.d(m2), .clk(clk), .q(out[1]), .qbar());
dff dff2(.d(m3), .clk(clk), .q(out[2]), .qbar());
dff dff3(.d(m4), .clk(clk), .q(out[3]), .qbar());

mux4_1 mux0(.I0(in[0]), .I1(x2), .I2(out[1]), .I3(out[0]), .sel(ctrl), .y(m1));
mux4_1 mux1(.I0(in[1]), .I1(out[0]), .I2(out[2]), .I3(out[1]), .sel(ctrl), .y(m2));
mux4_1 mux2(.I0(in[2]), .I1(out[1]), .I2(out[3]), .I3(out[2]), .sel(ctrl), .y(m3));
mux4_1 mux3(.I0(in[3]), .I1(out[2]), .I2(x3), .I3(out[3]), .sel(ctrl), .y(m4));
endmodule