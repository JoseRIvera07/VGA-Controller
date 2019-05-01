module mux_sprite_state  ( 
    input logic  sprite_on,
	 input logic selector,
	 output  logic  mux_out
);
logic [23:0] color = 24'b111111111111111111111111;
always_comb
begin
	case (selector)
		1:  mux_out = 0;
		default:  mux_out = sprite_on;
		
	endcase

end
endmodule
