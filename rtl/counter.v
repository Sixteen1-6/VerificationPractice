module counter( // decleares hardware module counter
    input wire clk, // clock signal
    input wire reset, // when 1 go to 0
    input wire enable, // when high count and pause when low
output reg [3:0] count//4bit
);
always @(posedge clk or posedge reset) begin // rising edge
    if (reset) begin
        count <= 4'b0000; // reset has priority
    end else if (enable) begin
        count <= count + 1; // increment counter each clock cycle
    end
    // If enable is low count stays paused
end

endmodule


