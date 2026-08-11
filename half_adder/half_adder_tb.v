`timescale 1ns/1ps

module half_adder_tb;

reg a ;
reg b ;
wire sum;
wire cout;

    half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .cout(cout));

initial begin
$dumpfile("half_adder.vcd");
$dumpvars(0, half_adder_tb);

end

// Display results
    initial begin
        $display("Time\ta\tb\tsum\tcout");
        $monitor("%0t\t%b\t%b\t%b\t%b",
                 $time, a, b, sum, cout);
    end

    // Test all 4 combinations
    initial begin
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule
