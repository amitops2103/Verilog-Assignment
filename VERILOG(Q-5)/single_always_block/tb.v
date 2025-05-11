`timescale 1ns/1ps
module tb_arbiter;                           
    reg clk, rstn;
    reg r1, r2, r3;
    wire a1, a2, a3;
  
    arbiter uut (.clk(clk),.rstn(rstn),.r1(r1),.r2(r2),.r3(r3),.a1(a1),.a2(a2),.a3(a3));

    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rstn = 0;
        r1 = 0;
        r2 = 0;
        r3 = 0;

        // Apply reset for 2 clock cycles
        @(posedge clk);  
        #1 rstn = 0;     // Small delay after clock edge
        @(posedge clk);
        #1 rstn = 1;
      
        // Test Case 1: request1
        @(posedge clk);
        #1 r1 = 1'b1;  
        @(posedge clk);
        #1 r1 = 1'b0;

        // Test Case 2: request2
        @(posedge clk);
        #1 r2 = 1'b1;
        @(posedge clk);
        #1 r2 = 1'b0;

        // Test Case 3: request3
        @(posedge clk);
        #1 r3 = 1'b1;
        @(posedge clk);
        #1 r3 = 1'b0;

        // Test Case 4: two requests (r1 and r2)
        @(posedge clk);
        #1 r1 = 1'b1;
        #1 r2 = 1'b1;
        @(posedge clk);
        #1 r1 = 1'b0;
        #1 r2 = 1'b0;

        // Test Case 5: two requests (r2 and r3)
        @(posedge clk);
        #1 r2 = 1'b1;
        #1 r3 = 1'b1;
        @(posedge clk);
        #1 r2 = 1'b0;
        #1 r3 = 1'b0;
      
      // Test Case 6: all requests (r1 and r2 and r3)
        @(posedge clk);
      #1 r1 = 1'b1;
        #1 r2 = 1'b1;
        #1 r3 = 1'b1;
        @(posedge clk);
      #1 r1 = 1'b0;
        #1 r2 = 1'b0;
        #1 r3 = 1'b0;
      
      // Test Case 7: rstn work
       @(posedge clk);  
        #1 rstn = 0;     
        @(posedge clk);
        #1 rstn = 1;
      
      // Test Case 8: request1 asserted for multiple cycle
        @(posedge clk);
        #1 r1 = 1'b1;
      #1 r1 = 1'b1;
      #1 r1 = 1'b1;
        @(posedge clk);
        #1 r1 = 1'b0;
      #1 r1 = 1'b0;
      #1 r1 = 1'b0;
      
      
      // Test Case 9: multiple requests (r1 and r2) and r1 is high for multiple cycle
        @(posedge clk);
        #1 r1 = 1'b1;
        #1 r2 = 1'b1;r1 = 1'b1;
        @(posedge clk);
        #1 r1 = 1'b0;
        #1 r2 = 1'b0;r1 = 1'b1;
      
      
        // Test Case 8: Apply reset again
        @(posedge clk);
        #1 rstn = 0;
        @(posedge clk);
        #1 rstn = 1;

        // Test Case 9: Check after reset
        @(posedge clk);
        #1 r1 = 1'b1;
        @(posedge clk);
        #1 r1 = 1'b0;

        // End simulation 
        $stop;
    end

    // Monitor the signals
    initial begin
        $monitor("Time = %0t | r1 = %b, r2 = %b, r3 = %b | a1 = %b, a2 = %b, a3 = %b | State = %b",
                 $time, r1, r2, r3, a1, a2, a3, uut.state);
       $dumpfile(" dump.vcd");
    $dumpvars(1);
    end
endmodule
