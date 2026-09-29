`timescale 1ns/1ps

module Tff_tb;

  // Inputs
  reg clk;
  reg rst;
  reg t;

  // Outputs
  wire q;
  wire qbar;

  // Instantiate the Unit Under Test (UUT)
  tff uut (
    .clk(clk), 
    .rst(rst), 
    .T(t), 
    .q(q), 
    .qbar(qbar)
  );
always #5 clk = ~clk; // Clock generation
  initial begin
    $dumpfile("Tff.vcd");
    $dumpvars(0, Tff_tb);
    // Initialize Inputs
    clk = 0;
    rst = 0;
    t = 0;

    // Wait for global reset to finish
    #10;
        
    // Add stimulus here
    rst = 1; #10; rst = 0; // Reset the flip-flop

    t = 1; #20; // Toggle input high
    t = 0; #20; // Toggle input low
    t = 1; #20; // Toggle input high again
    t = 0; #20; // Toggle input low again

    $finish; // End simulation
  end

endmodule
