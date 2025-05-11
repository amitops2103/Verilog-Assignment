`timescale 1ns / 1ps

module tb_positive_edgedetector;
  reg clk;
  reg rstn;
  reg a;
  wire b;
  positive_edgedetector test (.clk(clk), .rstn(rstn), .a(a), .b(b));
  always #5 clk = ~clk;
  initial begin
    $monitor("Time=%0t | clk=%b | rstn=%b | a=%b | b=%b", $time, clk, rstn, a, b);
    clk = 0;
    rstn = 0;
    a = 0;
    #10;
    rstn = 1;
    #10;
    // Test Case 1: Multiple positive edges
    a = 1;
    #10;
    a = 0;
    #10;
    a = 1;
    #10;
    a = 0;
    #20;
    // Test Case 2: Apply reset in between
    a = 1;
    #10;
    rstn = 0;
    #10;
    rstn = 1;
    #10;
    $finish;
  end
  initial begin
    $monitor("Time = %0t | clk = %b | rstn = %b | a = %b | b = %b", $time, clk, rstn, a, b);
    $dumpfile(" dump.vcd");
    $dumpvars(1); 
  end
endmodule
