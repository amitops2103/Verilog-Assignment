`timescale 1ns/1ns
module tb_sequential_circuit_Q2;
    reg clk;
    reg rstn;
    reg a;
    wire b;
    wire c;
  sequential_circuit_Q2 test (.clk(clk), .rstn(rstn), .a(a), .b(b), .c(c));
    always #5 clk = ~clk; 
    initial begin
      clk = 0;
      rstn = 0;
      a = 0;
      #10 rstn = 1;
      #10 a = 1;
      #10 a = 0;
      #20 a = 1;
      #10 a = 0;
      #10 a = 1;
      #50;
      $finish;
    end
    initial begin
        $monitor("Time = %0t | clk = %b | rstn = %b | a = %b | b = %b | c = %b", $time, clk, rstn, a, b, c);
       $dumpfile(" dump.vcd");
       $dumpvars(1); 
    end
endmodule
