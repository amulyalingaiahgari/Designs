module frequency_divider(
  input clk,rst,
  output reg out,
  output div_2,div_4,div_8);
  
  reg [2:0] count;
  
  always @(posedge clk or negedge rst) begin
    if(!rst) begin
      count<=0;
      out<=0;
    end
    else begin
      count<=count+1;
      if(count==3'b111) begin
        out<=~out;
        count<=0;
      end
    end
  end
  
  assign div_2=count[0];
  assign div_4=count[1];
  assign div_8=count[2];
  
  endmodule
