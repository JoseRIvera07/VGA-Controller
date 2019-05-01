module cronometer (
	input clk,
	input rst,
	input [3:0] step,
	output  logic  done
);

logic [1:0] seconds = 0;
logic doneTemp;
always_ff @(posedge clk, posedge rst) 
	begin
		if (rst)
			begin
				seconds = 0;
				doneTemp <= 0;
			end
		else
		begin
			if(step==4'b0010)
			begin
				if(seconds==2'b10) begin
						seconds = 2'b01;
						doneTemp <= 1;
				end
				else begin
					seconds = seconds + 1;
					doneTemp <= 0;
				end
			end
			else doneTemp <=0;
		end
		done <= doneTemp;
	end
endmodule
