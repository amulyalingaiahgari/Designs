module tb_ha(t_sum,t_carry,t_a,t_b);
  output reg t_a;
  output reg t_b;
  input t_sum;
  input t_carry;
  
  initial begin
    t_a=1'b0;t_b=1'b0;
    #5 t_a=1'b0;t_b=1'b1;
    #5 t_a=1'b1;t_b=1'b0;
    #5 t_a=1'b1;t_b=1'b1;
    #5 $finish;
  end
endmodule
