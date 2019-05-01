module vlineGenerator (
	input clk,
	input win,
	input [9:0] pixel_x,pixel_y,
	output vline_on,
	output logic [23:0] vline
);

logic [23:0] color = 24'b111111111111111111111111; 

always @(posedge clk)
begin
	if(!win)
	begin
		if(pixel_x < 453 && pixel_x>=451)
		begin
			vline <= 0;
			vline_on<= 1;
		end
		else begin
			vline_on<= 0;
		end
	end
	else vline_on<= 0;

end
endmodule
