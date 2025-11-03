module fact(in,out);
  input [7:0]in;
  output reg [15:0]oout;
  integer i;

  always @(*) begin
    out=1;
    for(i=1; i<=in; i=i+1)
      out = out*i;
  end
endmodule
