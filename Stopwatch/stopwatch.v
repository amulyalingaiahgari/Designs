module stop_watch (
  input clk, rst,
  input start_stop,
  output reg [5:0]sec,min,
  output reg [3:0]hour );

  reg run;
  reg [5:0]sec_count;
  reg [5:0]min_count;
  reg [3:0]hour_count;

  always @(posedge clk or posedge rst) begin
    if(rst) begin
      sec_count <= 0;
      min_count <= 0;
      hour_count <= 0;
      sec <= 0;
      min <= 0;
      hour <= 0;
      run <= 0;
    end
    else if(start_stop) begin
      run <= ~run;
    end
    else if(run) begin
      if(sec_count==59) begin
        sec_count <= 0;
        if(min_count==59) begin
          min_count <= 0;
          if(hour_count==23) begin
            hour_count <= 0;
          end
          else begin
            hour_count <= hour_count+1;
          end
        end
        else begin
          min_count <= min_count+1;
        end
      end
      else begin
        sec_count <= sec_count+1;
      end
    end
  end

  always @(sec_count or min_count or hour_count) begin
    sec <= sec_count;
    min <= min_count;
    hour <= hour_count;
  end
  
endmodule
