module sequential_circuit_Q2 (input clk, input rstn, input a, output reg b, output reg c);
always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        b <= 0;
        c <= 0;
    end else begin
        b <= a;
        c <= b;
    end
end
endmodule
