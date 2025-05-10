module tb_slicing();
  reg [7:0]A;
  wire [4:0]B;
  wire [2:0]C;

  slicing dut(B,C,A);
  initial begin
    A=8'b11010001;
    #5 A=8'b00110101;
    #5 A=8'b10001100;
    #5 $finish;
  end
endmodule  
