module counter (input wire clk, input wire rstn, input wire ena, input wire up_down, input wire hold, output reg [7:0] cnt);
  always @(posedge clk or negedge rstn) begin
    if (!rstn) 
      cnt <= 8'b0;
    else if (ena) begin
      if (!hold) begin
        if (up_down)
          cnt <= cnt + 1;
        else
          cnt <= cnt - 1;
      end
    end
    else
      cnt <= 8'b0;
  end
endmodule
