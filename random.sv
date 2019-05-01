module random(
	input clk,
	input rst,
	input [3:0] step,
	output logic [2:0] randnum,
	output logic randReady
);

logic [6:0] cnt = 0;
logic [2:0] randnumTemp;

always_ff @(posedge clk, posedge rst) 
	begin
		if (rst)
			begin
				cnt = 0;
				randnum <= 0;
			end
		else
		begin
				if(cnt==7'b1010000) 
				begin
						cnt = 0;
				end
				else 
				begin
					cnt = cnt + 1;
				end
			if(step==4'b0001)
			begin 
				if(cnt>=7'b0000000 && cnt<7'b0010100)
				begin
					randnumTemp <= 3'b001;
					randReady <= 1;
				end
				else if(cnt>=7'b0010100 && cnt<7'b0101000)
				begin
					randnumTemp <= 3'b010;
					randReady <= 1;
				end
				else if(cnt>=7'b0101000 && cnt<7'b0111100)
				begin
					randnumTemp <= 3'b011;
					randReady <= 1;
				end
				else 
				begin
					randnumTemp <= 3'b100;
					randReady <= 1;
				end
			end
			else 
			begin
				randnum <= randnumTemp;
				randReady <= 0;
				//cnt = 0;
			end
		end
		 randnum <= randnumTemp;
	end

endmodule
