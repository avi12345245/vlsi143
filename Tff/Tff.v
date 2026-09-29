module tff (T, clk, q, qbar, rst);
    input wire T, clk, rst;
    output reg q, qbar;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 1'b0;
            qbar <= 1'b0;
        end
        else if (T) begin
            q <= ~q;
            qbar <= ~qbar;
        end
    end

endmodule