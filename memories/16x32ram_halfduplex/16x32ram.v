module mem (d_out,d_in,r_w,addr,clk,rst);
  input clk;
  input [4:0]addr;//address to select memory location
  input r_w;//to select read or write operation
  input rst;
  input [15:0]d_in;//data i/p to write into memory
  //input en;//to enable the operation
  output reg [15:0]d_out;//data o/p from memory
  reg [15:0] memory [0:31] ;
  
  always @(posedge clk) begin
    if(rst)
      memory[addr] <= 0;
    else
      if(r_w)
      memory[addr] <= d_in;
    else
    d_out <= memory [addr] ;
  end
endmodule
//r_w == 1 ---- write
//r_w == 0 - - - -read
