module hlineGenerator (
	input win,
	input [9:0] pixel_x,pixel_y,
	output hline_on,
	output [23:0] hline
);

reg [23:0] color = 24'b111111111111111111111111; 
always_comb begin
	if(win) hline<=0;
	else begin
		if(pixel_y<=262 && pixel_y>=266 && pixel_x<=780 && pixel_x>=140) hline<=color;
		else hline<=0;
	end
end
endmodule
