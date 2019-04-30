module mux_RGB  ( 
    input logic [23:0] hline,vline,sprite,msg,slc,
	 input [2:0] selector,
	 output  logic [23:0] mux_out
);
logic [23:0] color = 24'b111111111111111111111111;
always_comb
begin
	case (selector)
		3'b000:  mux_out = hline;
		3'b001: mux_out = vline;
		3'b010: mux_out = sprite;
		3'b011: mux_out = msg;
		3'b100: mux_out = slc;
		default:  mux_out = color;
		
	endcase

end
endmodule
