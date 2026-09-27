module p_encoder (i, y);
    input wire  [3:0] i;
    output reg [1:0] y;

    always@ (i) begin
        casez (i)
            4'b0001 : y = 2'b00;
            4'b001? : y = 2'b01;
            4'b01?? : y = 2'b10;
            4'b1??? : y = 2'b11;
        endcase
    end
endmodule
