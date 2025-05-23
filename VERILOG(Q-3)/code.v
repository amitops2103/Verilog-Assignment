module positive_edgedetector (input wire clk, input wire rstn, input wire a, output reg b);
   reg prev_a; // stores the previous cycle's value of a
  always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
      prev_a <= 0;
      b <= 0;
    end
    else begin
      b <= (a & ~prev_a);  // Detect positive edges
      prev_a <= a;  // Store current input for the next cycle
    end
  end
    
endmodule
