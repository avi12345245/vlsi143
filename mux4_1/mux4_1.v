module mux4_1(
input I0,
input I1,
input I2,
input I3,
input wire [1:0] sel,
output reg y);

always @(*) begin
   case (sel)
        2'b00: y = I0;
        2'b01: y = I1;
        2'b10: y = I2;
        2'b11: y = I3;
  endcase
end
endmodule
