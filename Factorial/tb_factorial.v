module tb;
  reg [7:0]in;
  wire [15:0]out;
  
  fact uut(in,out);
  in=6;
  #5 $finish;
  $monitor("factorial is %d", out);
  end
endmodule
