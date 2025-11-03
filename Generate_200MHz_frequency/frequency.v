`timescale 1ns/1ps
module freq(
    input clk200mhz,
    input rst,
    output reg clk100mhz
);

  always @(posedge clk200mhz) begin
    if (rst)
        clk100mhz <= 0;
    else
        clk100mhz <= ~clk100mhz;
  end
endmodule
