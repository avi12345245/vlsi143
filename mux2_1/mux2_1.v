module mux2_1(
input a,
input b,
input s0,
output y);

assign y = s0 ? b : a;
endmodule 

