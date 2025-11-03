module frequency_divider_tb;
  reg clk, rst;
  wire out;
  wire div_2,div_4,div_8;
  
  frequency_divider dut(clk,rst,out,div_2,div_4,div_8);
  always #5 clk = ~clk;
  initial begin
    $monitor("time:%0t, out=%b, div_8:%b, div_4:%b, div_2:%b", $time, out, div_8, div_4, div_2);
    clk=0;
    rst=1;
    @(negedge clk) rst=0;
    @(negedge clk) rst=1;
    #100 $finish;
  end
endmodule
