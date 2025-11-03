module tb_traffic_light;
    // Inputs
    reg clk;
    reg reset;
    // Outputs
    wire [2:0] light;

    // Instantiate the traffic light module
    traffic_light uut ( .clk(clk), .reset(reset), .light(light) );

    // Clock generation: 10 time units period
    always #5 clk = ~clk;

    // Initial block for simulation control
    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        // Hold reset for one clock cycle
        #10;
        reset = 0;
        // Run simulation for some time
        #100;
        $finish;
    end

    // Monitor the output
    initial begin
        $display("Time\tReset\tLight");
        $monitor("%0t\t%b\t%b", $time, reset, light);
    end

endmodule
