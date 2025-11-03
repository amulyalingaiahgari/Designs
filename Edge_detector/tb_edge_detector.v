module edge_detector_tb();
  reg clk;
  reg signal;
  wire rising_edge, falling_edge;
  
  edge_detector dut(clk,signal,rising_edge,falling_edge);
  always #5 clk = ~clk;
  initial begin
    $monitor("time=%0t, signal=%b, rising_edge=%b, falling_edge=%b", $time, signal, rising_edge, falling_edge);
    clk=0; signal=0;
    #10 signal=1;
    #20 signal=0;
    #10 signal=1;
    #10 signal=1;
    #10 $finish;
  end
endmodule
