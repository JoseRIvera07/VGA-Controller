module counter (
	input clk,
	input rst,
	input [3:0] step,
	output  logic [2:0] enable
);

logic [2:0] seconds = 0;

always_ff @(posedge clk, posedge rst) 
	begin
		if (rst)
			begin
				seconds = 0;
				enable <= 0;
			end
		else
			if(step==4'b0011)
			begin
				if(seconds==3'b100) begin
						seconds = 3'b001;
						enable <= seconds;
				end
				else begin
					seconds = seconds + 1;
					enable <= seconds;
				end
			end
			else enable <= seconds;
	end

endmodule: counter