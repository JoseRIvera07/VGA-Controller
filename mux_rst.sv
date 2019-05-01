module mux_rst  ( 
	 input [3:0] selector,
	 output  logic mux_out
);

always_comb
begin
	case (selector)
		4'b0000:  mux_out = 1;
		default:  mux_out = 0;
		
	endcase

end
endmodule
