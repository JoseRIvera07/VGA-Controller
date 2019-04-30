module mux_clk (
	input clk, clk_boton,
	input [3:0] step,
	output logic Nclk
);

always_comb
begin
	case (step)
		4'b0001:  Nclk = clk_boton;
		4'b0011:  Nclk = clk_boton;
		4'b0100:  Nclk = clk_boton;
		4'b0101:  Nclk = clk_boton;
		4'b0110:  Nclk = clk_boton;
		default:  Nclk = clk;
		
	endcase

end
endmodule
