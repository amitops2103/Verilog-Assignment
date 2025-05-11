module arbiter (input wire clk,input wire rstn,
                input wire r1, r2, r3,
                output reg a1, a2, a3);

    // State encoding
    parameter [1:0] S1 = 2'b00, 
                    S2 = 2'b01, 
                    S3 = 2'b10;

    // State vector
    reg [1:0] state, next_state;

    // State transition logic
    always @(posedge clk or negedge rstn) begin
        if (!rstn)
            state <= S1;  // Reset to initial state
        else
            state <= next_state;
    end

    // Next state logic
    always @(posedge clk or negedge rstn) begin
        case (state)
            S1: begin
                if (r1 && !a1)
                    next_state = S2;
                else if (r2 && !a2)
                    next_state = S3;
                else if (r3 && !a3)
                    next_state = S1;
                else
                    next_state = S1;
            end

            S2: begin
                if (r2 && !a2)
                    next_state = S3;
                else if (r3 && !a3)
                    next_state = S1;
                else if (r1 && !a1)
                    next_state = S2;
                else
                    next_state = S2;
            end

            S3: begin
                if (r3 && !a3)
                    next_state = S1;
                else if (r1 && !a1)
                    next_state = S2;
                else if (r2 && !a2)
                    next_state = S3;
                else
                    next_state = S3;
            end

            default: next_state = S1;
        endcase
    end

    // Output logic
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            a1 <= 0;
            a2 <= 0;
            a3 <= 0;
        end
        else begin
            case (state)
                S1: begin
                    if (r1 && !a1) begin
                        a1 <= 1; a2 <= 0; a3 <= 0;
                    end
                    else if (r2 && !a2) begin
                        a2 <= 1; a1 <= 0; a3 <= 0;
                    end
                    else if (r3 && !a3) begin
                        a3 <= 1; a1 <= 0; a2 <= 0;
                    end
                    else begin
                        a1 <= 0; a2 <= 0; a3 <= 0;
                    end
                end

                S2: begin
                    if (r2 && !a2) begin
                        a2 <= 1; a1 <= 0; a3 <= 0;
                    end
                    else if (r3 && !a3) begin
                        a3 <= 1; a1 <= 0; a2 <= 0;
                    end
                    else if (r1 && !a1) begin
                        a1 <= 1; a2 <= 0; a3 <= 0;
                    end
                    else begin
                        a1 <= 0; a2 <= 0; a3 <= 0;
                    end
                end

                S3: begin
                    if (r3 && !a3) begin
                        a3 <= 1; a1 <= 0; a2 <= 0;
                    end
                    else if (r1 && !a1) begin
                        a1 <= 1; a3 <= 0; a2 <= 0;
                    end
                    else if (r2 && !a2) begin
                        a2 <= 1; a1 <= 0; a3 <= 0;
                    end
                    else begin
                        a1 <= 0; a2 <= 0; a3 <= 0;
                    end
                end

                default: begin
                    a1 <= 0; a2 <= 0; a3 <= 0;
                end
            endcase
        end
    end
endmodule
