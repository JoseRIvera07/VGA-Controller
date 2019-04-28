module clk_div (
    input clk,
    output reg clk_div
    );
logic clk25 = 0;


always @(posedge clk) begin
	if(clk == 1'b1)
		begin
			clk25 = ~clk25;
		end
end
assign clk_div = clk25;
endmodule
