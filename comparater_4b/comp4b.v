module comp4b (a, b, G, E, L);
    input wire [3:0] a;
    input wire [3:0] b;
    output wire G;
    output wire E;
    output wire L;
wire [2:0] y1, y2, y3, y4;
    
    comp1b c1 (a[0], b[0], y1);
    comp1b c2 (a[1], b[1], y2);
    comp1b c3 (a[2], b[2], y3);
    comp1b c4 (a[3], b[3], y4);
    
    assign G = y4[2] |
           (y4[1] & y3[2]) |
           (y4[1] & y3[1] & y2[2]) |
           (y4[1] & y3[1] & y2[1] & y1[2]);

    assign E = y4[1] & y3[1] & y2[1] & y1[1];
    assign L = y4[0] |
           (y4[1] & y3[0]) |
           (y4[1] & y3[1] & y2[0]) |
           (y4[1] & y3[1] & y2[1] & y1[0]);
endmodule
