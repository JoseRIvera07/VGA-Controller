module selectionCompartor (
   input clk,
	input [3:0] step,
	input logic [2:0] icuadrante,cuadranterandom,
	output finish,win,rst
);

logic finishTemp=0;
logic winTemp=0;
logic rsttemp=0;

always @(posedge clk)
begin
	if(step==4'b0111)
	begin
		if(icuadrante==cuadranterandom)
		begin
			finishTemp <= 0;
			winTemp <= 1;
			rsttemp<=0;
		end
		else begin 
			finishTemp <= 1;
				winTemp <= 0;
				rsttemp <= 1;
		end
	end
	else if(step==4'b0000)
	begin
			finishTemp <= 0;
			winTemp <= 0;
			rsttemp<=1;
	end
	else 
	begin 
		finish<=finishTemp;
		win<=winTemp;
		rsttemp<=0;
	end
	finish<=finishTemp;
	win<=winTemp;
	rst<=rsttemp;

end
endmodule
