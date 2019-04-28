module mux_cuadrante  ( 
    input logic [1:0] cuadranteFSM,cuadranteRandom,
	 input [3:0] state,
	 output  logic [1:0] mux_out
);

always_comb
begin
	case (state)
		4'b0001:  mux_out = cuadranteRandom;
		4'b0011: mux_out = cuadranteFSM;
		4'b0100: mux_out = cuadranteFSM;
		4'b0101: mux_out = cuadranteFSM;
		4'b0110: mux_out = cuadranteFSM;
		default:  mux_out = 4'bxxxx;
		
	endcase

end
endmodule
