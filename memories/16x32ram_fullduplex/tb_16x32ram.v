module tb_mem();
  reg clk;
  reg rst;
  reg wr;
  reg [4:0]waddr;
  reg [15:0]d_in;
  reg rd;
  reg [4:0]raddr;
  wire [15:0]d_out;

  mem uut (d_out,d_in,rd,raddr,wr,waddr,clk,rst);
  always #2 clk = ~clk;
  initial begin
    clk =0;
    rst =1;
    rd=0;wr=0; raddr=0;waddr=0;
    #4 rst =0;
    wr=1; waddr = 5'b00101; d_in = 16'haabb;
    #9 wr=1; waddr = 5'b01001; d_in = 16'habcd;
    #6 Wr=0; waddr = 5'b01010; d_in = 16'h2525;

    #8 rd=1; raddr = 5'b00101; $display("d_out:%h",d_out);
    #7 rd=1; raddr = 5'b01010; $display("d_out:%h",d_out);
    #8 rd=0; raddr = 5'b01001; $display("d_out:%h",d_out);
    #6 rd=1; raddr = 5'b01001; $display("d_out:%h",d_out);

    #20 $finish;
  end
endmodule
