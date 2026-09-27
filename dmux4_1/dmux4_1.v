module dmux4_1(i, sel, y);
    input wire [3:0] i;
    input wire [1:0] sel;
    output wire y;

    assign y = (sel == 2'b00) ? i[0] :
               (sel == 2'b01) ? i[1] :
               (sel == 2'b10) ? i[2] :
               (sel == 2'b11) ? i[3] : 1'b0;

endmodule