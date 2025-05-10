module mem (d_out, d_in, rd, raddr, wr, waddr, clk, rst);
  input clk;
  input rst;
  input rd;
  input [4:0]raddr;
  input wr;
  input [4:0]waddr;
  input [15:0]d_in;
  output reg [15:0]d_out;
  reg [15:0]memory [0:31] ;

  always @(posedge clk) begin
    if (rst)
      memory[waddr] <= 0;
    else
      if(wr == 1)
      memory[waddr] <= d_in;
     else if(rd == 1)
      d_out <= memory[raddr];
    else
    memory [waddr] <= 0;
  end
endmodule
