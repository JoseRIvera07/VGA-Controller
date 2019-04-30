module selector  ( 
    input logic hline_on,vline_on,sprite_on,msg_on,slc_on,
	 output  logic [2:0] seleccion
);

always_comb
begin
	if(hline_on) seleccion<=3'b000;
	else if(vline_on) seleccion<=3'b001;
	else if(sprite_on) seleccion<=3'b010;
	else if(msg_on) seleccion<=3'b011;
	else if(slc_on) seleccion<=3'b100;
	else seleccion<=3'b101;
end
endmodule
