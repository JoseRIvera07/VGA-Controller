module selectionCompartor (
   input clk,
	input [3:0] step,
	input logic [2:0] icuadrante,cuadranterandom,
	output finish,win
);

logic finishTemp=0;
logic winTemp=0;

always @(posedge clk)
begin
	if(step==4'b0111)
	begin
		if(icuadrante==cuadranterandom)
		begin
			finishTemp <= 0;
			winTemp <= 1;
		end
		else begin 
			finishTemp <= 1;
				winTemp <= 0;
		end
	end
	else 
	begin 
		finish<=finishTemp;
		win<=winTemp;
	end
	finish<=finishTemp;
	win<=winTemp;

end
endmodule
