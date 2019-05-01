module mux_RGB_msg  (
	 input [1:0] selector,
	 output  logic [23:0] mux_out
);

always_comb
begin
	case (selector)
		1'b0: mux_out = 24'b000000000000000000000000;
		1'b1: mux_out = 24'b111111111111111111111111;
		default:  mux_out = 24'b111111111111111111111111;
		
	endcase

end
endmodule
