`timescale 1ns/1ps
module tbfreq;
  reg clk200mhz;
  reg rst;
  wire clk100mhz;

  freq uut (clk200mhz, rst, clk100mhz);  // Instantiate DUT

  // Clock generation
  always #2.5 clk200mhz = ~clk200mhz;  // 200 MHz clock (T = 5 ns)

  // Test sequence
  initial begin
    clk200mhz = 1;
    rst = 1;
    #5 rst = 0;       // Release reset after 5 ns
    #50 $finish;      // Stop simulation after 50 ns
  end
endmodule
