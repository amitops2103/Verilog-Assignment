`timescale 1ns/1ps
module counter_tb;
  reg clk;
  reg rstn;
  reg ena;
  reg up_down;
  reg hold;
  wire [7:0] cnt;
  counter test (.clk(clk), .rstn(rstn), .ena(ena), .up_down(up_down), .hold(hold), .cnt(cnt));
  always #5 clk = ~clk;
  initial begin
    clk = 0;
    rstn = 0;
    ena = 0;
    up_down = 0;
    hold = 0;
    #10 rstn = 1;  // Release reset after 10ns
    #10 ena = 1; up_down = 1;
    #50 hold = 1;  // Hold counter for a few cycles
    #20 hold = 0;  // Resume counting
    #50 up_down = 0;  // Change direction to Down
    #50 ena = 0;  // Disable counting
    #30 ena = 1;  // Enable
    #20 rstn = 0;
    #10 rstn = 1;
    #50 $finish; // End simulation
  end
  initial begin
    $monitor("Time = %t | rstn = %b | ena = %b | up_down = %b | hold = %b | cnt = %d",$time, rstn, ena, up_down, hold, cnt);
    $dumpfile(" dump.vcd");
    $dumpvars(1);
  end
endmodule
