module arbiter (input wire clk,input wire rstn,input wire r1,input wire r2,input wire r3,
                output reg a1,output reg a2,output reg a3);
  
  //state encoding
  parameter [1:0] S1 = 2'b00, S2 = 2'b01, S3 = 2'b10;
  
  //state_vector 
  reg [1:0] state;
  
  // Combined state transition and output logic
  always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
      state <= S1;
      a1 <= 0;
      a2 <= 0;
      a3 <= 0;
    end
    else begin
      case (state)
        S1:begin
          if (r1 && !a1) begin
            a1 <= 1; a2 <= 0; a3 <=0;
            state <= S2;
          end
          else if (r2 && !a2) begin
            a2 <= 1; a1 <= 0; a3 <= 0;
            state <= S3;
          end
          else if (r3 && !a3) begin
            a3 <= 1; a1 <= 0; a2 <= 0;
            state <= S1;
          end
          else begin
            a1 <= 0;
            a2 <= 0;
            a3 <= 0;
          end
        end
        
        S2:begin
          if (r2 && !a2) begin
            a2 <= 1; a1 <= 0; a3 <=0;
            state <= S3;
          end
          else if (r3 && !a3) begin
            a3 <= 1; a1 <= 0; a2 <= 0;
            state <= S1;
          end
          else if (r1 && !a1) begin
            a1 <= 1; a2 <= 0; a3 <= 0;
            state <= S2;
          end
          else begin
            a1 <= 0;
            a2 <= 0;
            a3 <= 0;
          end
        end
        
        S3:begin
          if (r3 && !a3) begin
            a3 <= 1; a1 <= 0; a2 <=0;
            state <= S1;
          end
          else if (r1 && !a1) begin
            a1 <= 1; a3 <= 0; a2 <= 0;
            state <= S2;
          end
          else if (r2 && !a2) begin
            a2 <= 1; a1 <= 0; a3 <= 0;
            state <= S3;
          end
          else begin
            a1 <= 0;
            a2 <= 0;
            a3 <= 0;
          end
        end
        
        default state <= S1;
      endcase
    end
  end
endmodule
