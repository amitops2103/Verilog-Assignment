module mux_Q1 (input [1:0] s0, input [7:0] x, input [7:0] y, output reg[7:0] z);
always @(*) begin
  case (s0)
        2'b00: z = 8'b0;       
        2'b01: z = x + y;       
        2'b10: z = x ^ y;       
        2'b11: z = ((x[0] & y[0]) == 1) ? 8'b0 : 8'b1; 
        default: z = 8'b0;
    endcase
end
endmodule
