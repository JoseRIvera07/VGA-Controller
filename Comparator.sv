module Comparator(
	input logic clk,
	input win,
	input logic [2:0] icuadrante,
	input logic [9:0] hcount, vcount,
	output logic [23:0] ocuadrante,
	output logic slc_on
);
						

logic [23:0] color = 24'b100000101100001111001010;

always @(posedge clk)
begin
if(!win)begin
		if(icuadrante==3'b001) 
		begin
			if(hcount>140 && hcount < 449 && vcount>37 && vcount < 273) 
			begin
					ocuadrante <= color;
					slc_on <= 1;
			end
				else slc_on <= 0;
		end
		else if(icuadrante==3'b010) 
		begin
			if(hcount<777 && hcount > 454 && vcount>37 && vcount < 273)
			begin
					ocuadrante <= color;
					slc_on <= 1;
			end
				else slc_on <= 0;
		end
		else if(icuadrante==3'b011) 
		begin
			if(hcount>140 && hcount < 449 && vcount<512 &&vcount > 278)
			begin
					ocuadrante <= color;
					slc_on <= 1;
			end
				else slc_on <= 0;
		end
		else if(icuadrante==3'b100) 
		begin
			if(hcount<777 && hcount > 454 && vcount<512 && vcount > 278)
			begin
					ocuadrante <= color;
					slc_on <= 1;
			end
				else slc_on <= 0;
		end
		else slc_on <= 0;
	end
	else slc_on <= 0;

end


endmodule
