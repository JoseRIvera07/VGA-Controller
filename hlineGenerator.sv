module hlineGenerator (
   input clk,
	input win,
	input [9:0] pixel_x,pixel_y,
	output hline_on,
	output logic [23:0] hline
);

logic [23:0] color = 24'b111111111111111111111111; 

always @(posedge clk)
begin
		if(pixel_y < 277 && pixel_y>=275)
		begin
			hline <= 0;
			hline_on<= 1;
		end
	else begin 
		hline_on<= 0;
	end

end
endmodule
