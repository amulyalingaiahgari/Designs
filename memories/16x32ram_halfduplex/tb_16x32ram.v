module tb_mem();
  reg clk;
  reg rst;
  reg r_w;
  reg [4:0]addr;
  reg [15:0]d_in;
  wire [15:0]d_out;

  mem dut (d_out,d_in,r_w,addr,clk,rst);
  always #2 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    #4 rst = 0;

    #6 r_w =1; addr = 5'b00111; d_in = 16'hcc33;
    #5 addr = 5'b00010; d_in = 16'h5577;  
    #3 addr = 5'b01110; d_in = 16'h1464;
    #4 addr = 5'b00110; d_in = 16'h1144;
    
    #5 r_w =0; addr = 5'b00111; $display("read data:%h",d_out);
    #6 addr = 5'b01110; $display ("read data:%h",d_out);
    #6 addr = 5'b00110; $display ("read data:%h",d_out);

    #15 $finish;
  end
endmodule
