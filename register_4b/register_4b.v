module register_4b (clk, load, data_in, data_out);
    input wire clk, load;
    input wire [3:0] data_in;
    output wire [3:0] data_out;

wire m0, m1, m2, m3;

dff dff0 (.d(m0), .clk(clk), .q(data_out[0]), .qbar());
dff dff1 (.d(m1), .clk(clk), .q(data_out[1]), .qbar());
dff dff2 (.d(m2), .clk(clk), .q(data_out[2]), .qbar());
dff dff3 (.d(m3), .clk(clk), .q(data_out[3]), .qbar());

mux2_1 mux0 (.a(data_out[0]), .b(data_in[0]), .s0(load), .y(m0));
mux2_1 mux1 (.a(data_out[1]), .b(data_in[1]), .s0(load), .y(m1));
mux2_1 mux2 (.a(data_out[2]), .b(data_in[2]), .s0(load), .y(m2));
mux2_1 mux3 (.a(data_out[3]), .b(data_in[3]), .s0(load), .y(m3));

endmodule

