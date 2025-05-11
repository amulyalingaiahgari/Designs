module mem2(d_out, clk, rst, r_w, addr, d_in) ;
  input clk;
  input rst;
  input r_w;
  input [4:0]addr;
  input [31:0]d_in;
  output [31:0]d_out;
  
  wire [15:0] d_out1;
  wire [15:0] d_out2;
  
  mem ml (.clk(clk), .rst(rst), .r_w(r_w), .addr(addr), .d_in(d_in[15:0]), .d_out(d_out1));
  mem m2 (.clk(clk), .rst(rst), .r_w(r_w), .addr(addr), .d_in(d_in[31:16]), .d_out(d_out2));
  assign d_out = {d_out2,d_out1};

endmodule
