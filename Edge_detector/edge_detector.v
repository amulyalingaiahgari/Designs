module edge_detector(clk,signal,rising_edge,falling_edge);  
  input clk;
  input signal;
  output reg rising_edge,falling_edge;
  reg prev;
  
  always @(posedge clk) begin
    prev<=signal;
    rising_edge <=(~prev) & signal; //detect 0 to 1
    falling_edge <= prev & ~signal; //detect 1 to 0
  end
  
endmodule
