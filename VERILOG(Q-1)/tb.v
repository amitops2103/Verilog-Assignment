module tb_mux_Q1;
  reg [1:0] s0;
  reg [7:0] x;
  reg [7:0] y;
  wire [7:0] z;
  mux_Q1 test (.s0(s0), .x(x), .y(y), .z(z));
  initial begin
    $monitor("Time=%0t | s0=%b | x=%d | y=%d | z=%d", $time, s0, x, y, z);
      x = 8'd9; y = 8'd5; 
      s0 = 2'b00;
      #10;  //  z = 0
      s0 = 2'b01;
      #10;  //  z = x + y
      s0 = 2'b10;
      #10;  //  z = x ^ y
      s0 = 2'b11;
      #10;  //  z = 0 
      x = 8'd3; y = 8'd7;
      s0 = 2'b11;
      #10; 
      x = 8'd4; y = 8'd7;
      s0 = 2'b11;
      #10; // Expect z = 1 since x is even(4)
      $finish;
    end
endmodule
