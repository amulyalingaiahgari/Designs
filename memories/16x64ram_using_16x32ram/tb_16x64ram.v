module tb_mem1;
  reg clk;
  reg rst;
  reg wr;
  reg [5:0]waddr;
  reg [15:0]d_in;
  reg rd;
  reg [5:0]raddr;
  wire [15:0]d_out;

  meml dut (d_out,d_in,rd,raddr,wr,waddr,clk,rst);
  always #2 clk = ~clk;
  initial begin
    clk=0;
    rst=1;
    #4 rst=0;

    wr=1; waddr=6'b000001; d_in=16'hadca;
    #10 wr=1; waddr=6'b000110; d_in=16'h5767;
    #10 wr=1; waddr=6'b110011; d_in=16'ha7cd;
    #10 wr=1; waddr=6'b011111; d_in=16'ha23d;

    #10 rd=1; raddr=6'b000001;
    #10 rd=1; raddr=6'b000110;
    #10 rd=1; raddr=6'b110011;
    #20 $finish;
  end
    always @(posedge clk) begin
      $display("time=%0t | wr=%b | rd=%b | waddr=%2d | raddr=%2d | data_in=%h | data_out=%h", $time, wr, rd, waddr, raddr, d_in, d_out);
    end

endmodule
