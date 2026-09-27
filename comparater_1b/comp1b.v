module comp1b (a, b, y);
    input wire a;
    input wire b;
    output wire [2:0] y;
    
    assign y[2] = (a & ~b);
    assign y[1] = ~(a ^ b);
    assign y[0] = (~a & b); 
endmodule
