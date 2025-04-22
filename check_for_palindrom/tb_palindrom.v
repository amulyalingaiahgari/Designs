module tbpd;
  reg [4:0]a;
  wire y;
  pd uut (a,y);
  initial begin
    a=5'b01010;
    #5 a=5'b10101;
    #5 a=5'b10001;
    #5 a=5'b10011;
  end
endmodule
