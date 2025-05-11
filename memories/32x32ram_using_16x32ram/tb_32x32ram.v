module tb_mem;
  reg clk;
  reg rst;
  reg r_w;
  reg [4:0]addr;
  reg [31:0]d_in;
  wire [31:0]d_out;

  mem2 dut (d_out,clk,rst,r_w,addr,d_in);

  always #2 clk = ~clk;
  initial begin
    clk=0;
    rst=1;
    #6 rst=0;
    
    r_w =1; addr = 0; d_in=32'hadc462;
    #6 addr =15; d_in =32'h4da65c;
    #6 addr =5; d_in=32'hfa537c;

    #6 r_w=0; addr = 15; $display("d_out:%h",d_out);
    #6 addr =1; $display("d_out:%h",d_out);
    #6 addr =5; $display("d_out:%h",d_out);
    #20 $finish;
  end
endmodule
