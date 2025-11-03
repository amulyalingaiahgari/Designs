module traffic_light(input clk, reset, output reg [2:0] light);
    reg [1:0] state;
    reg [1:0] next_state;

    // States
    parameter RED = 2'b00, YELLOW = 2'b01, GREEN = 2'b10;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= RED;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            RED: next_state = GREEN;
            YELLOW: next_state = RED;
            GREEN: next_state = YELLOW;
            default: next_state = RED;
        endcase
    end

    always @(state) begin
        case (state)
          RED: light = 3'b100;  // Red
            YELLOW: light = 3'b010;  // Yellow
            GREEN: light = 3'b001;  // Green
            default: light = 3'b100;
        endcase
    end
endmodule
