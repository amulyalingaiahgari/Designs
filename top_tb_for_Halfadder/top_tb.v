module top_tb;
  wire A;
  wire B;
  wire S;
  wire C;

  ha dut(.sum(S), .carry(C), .a(A), .b(B));
  tb_ha tb(.t_sum(S), .t_carry(C), .t_a(A), .t_b(B));

endmodule
