module tb_fibonacci;
  reg clk,rst;
  wire [31:0]present,next;
  fibonacci dut(clk,rst,present,next);
  always #2 clk= ~clk;
  initial begin
    $monitor("time:%0d | present=%d | next=%d",$time,present,next);
    clk=0;
    rst=1;
    #4 rst=0;
    #300 $finish;
  end
endmodule
