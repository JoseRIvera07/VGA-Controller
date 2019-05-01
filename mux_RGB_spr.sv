module mux_RGB_spr  (
	 input [4:0] selector,
	 output  logic [23:0] mux_out
);

always_comb
begin
	case (selector)
		5'b00000: mux_out = 24'b111111111111111111111111;
		5'b00001: mux_out = 'h582818;
		5'b00010: mux_out = 'h784820;
		5'b00011: mux_out = 'he8e0e0;
		5'b00100: mux_out = 'h381810;
		5'b00101: mux_out = 'h181818;
		5'b00110: mux_out = 'h203068;
		5'b00111: mux_out = 'hf8f8f8;
		5'b01000: mux_out = 'h4078d8;
		5'b01001: mux_out = 'h80b0f8;
		5'b01010: mux_out = 'h1810c0;
		5'b01011: mux_out = 'h6848e8;
		5'b01100: mux_out = 'h9878e8;
		5'b01101: mux_out = 'h5020c8;
		5'b01110: mux_out = 'h505048;
		5'b01111: mux_out = 'h103868;
		5'b10000: mux_out = 'hffff05;
		5'b10001: mux_out = 'h206090;
		5'b10010: mux_out = 'h102048;
		5'b10010: mux_out = 'ha0f8f8;
		5'b10100: mux_out = 'h000000;
		5'b10101: mux_out = 'h48e0f0;
		5'b10110: mux_out = 'h181068;
		5'b10111: mux_out = 'h1038f8;
		default:  mux_out = 24'b111111111111111111111111;
		
	endcase

end
endmodule
