module vlineGenerator (
	input win,
	input [9:0] pixel_x,pixel_y,
	output vline_on,
	output [23:0] vline
);

reg [23:0] color = 24'b111111111111111111111111; 
always_comb begin
	if(win) vline<=0;
	else begin
		if(pixel_x<=320 && pixel_x>=316 && pixel_y<=514 && pixel_y>=34) vline<=color;
		else vline<=0;
	end
end
endmodule
