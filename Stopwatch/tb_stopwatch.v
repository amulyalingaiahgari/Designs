module tb_stopwatch();
  reg clk, rst;
  reg start_stop;
  wire [5:0]sec,min;
  wire [3:0]hour;

  stopwatch dut(clk,rst,start_stop,sec,min,hour);
  
  always #2 clk = ~clk;

  initial begin
    $monitor("Time=%0d:%0d:%0d", hour, min, sec);
    clk=0;
    rst=1;
    start_stop=0;
    #4 rst=0;
    start_stop=1;
    #20 start_stop=0;
    #100 start_stop=1;
    #10 start_stop=0;
    #200 start_stop=1;
    #30 start_stop=0;
    #50 $finish;
  end

endmodule
