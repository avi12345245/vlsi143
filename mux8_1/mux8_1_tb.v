`timescale 1ns/1ps

module mux8_1_tb;

    reg [7:0] I;
    reg [2:0] sel;
    wire y;

    // Instantiate DUT
    mux8_1 uut (
        .I(I),
        .sel(sel),
        .y(y)
    );

    // Generate VCD file
    initial begin
        $dumpfile("mux8_1.vcd");
        $dumpvars(0, mux8_1_tb);
    end

    // Display results
    initial begin
        $display("Time\tI\t\tSel\tY");
        $monitor("%0t\t%b\t%b\t%b", $time, I, sel, y);
    end

    // Test all 8 select cases
    initial begin

        I = 8'b10101010;

        sel = 3'b000; #10;
        sel = 3'b001; #10;
        sel = 3'b010; #10;
        sel = 3'b011; #10;
        sel = 3'b100; #10;
        sel = 3'b101; #10;
        sel = 3'b110; #10;
        sel = 3'b111; #10;

        $finish;
    end

endmodule
