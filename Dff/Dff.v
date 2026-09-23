module dff(d, clk, q, qbar);
    input wire d, clk;
    output reg q, qbar;

    always@(posedge clk) begin
        q <= d;
        qbar <= ~d;
    end
endmodule