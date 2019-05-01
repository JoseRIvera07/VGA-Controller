module new_clock (
	input clk,
	input rst,
	output q
);

logic [25:0] cnt = 0;

always_ff @(posedge clk, posedge rst) 
	begin
		if (rst)
			begin
				cnt = 0;
				q <= 0;
			end
		else if (cnt == 26'b10111110101111000010000000)
			begin
				cnt = 0;
				q <= 1;
			end
		else
			begin
				cnt = cnt + 1;
				q <= 0;
			end
	end

endmodule: new_clock