module sprite(
	input clk,
	input [3:0] step,
	input [2:0] cuadrante,
	input [9:0] pixel_x,pixel_y,
	output enable,
	output logic [23:0] sprite
);

logic [23:0] color = 24'b111111111111111111111111; 

always @(posedge clk)
begin
	if(step==4'b0010)
	begin
		if(cuadrante==3'b001)
		begin
			if(pixel_x>=266 && pixel_x < 330 && pixel_y>= 120 && pixel_y < 184)
			begin
				sprite <= 0;
				enable <= 1;
			end
			else begin
				enable <= 0;
			end
		end

		else if(cuadrante==3'b010)
		begin
			if(pixel_x>=586 && pixel_x < 650 && pixel_y>= 120 && pixel_y < 184)
			begin
				sprite <= 0;
				enable <= 1;
			end
			else begin
				enable <= 0;
			end
		end
		
		else if(cuadrante==3'b011)
		begin
			if(pixel_x>=266 && pixel_x < 330 && pixel_y>= 361 && pixel_y < 425)
			begin
				sprite <= 0;
				enable <= 1;
			end
			else begin
				enable <= 0;
			end
		end
		
		else if(cuadrante==3'b100)
		begin
			if(pixel_x>=586 && pixel_x < 650 && pixel_y>= 361 && pixel_y < 425)
			begin
				sprite <= 0;
				enable <= 1;
			end
			else begin
				enable <= 0;
			end
		end
		else enable <= 0;
	end
	else enable <= 0;

end
endmodule
