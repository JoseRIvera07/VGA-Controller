module mux_rst  ( 
	 input logic iwin,ifinish,idone,idone2,
	 input [3:0] selector,
	 output  logic win,finish,done,done2
);

always_comb
begin
	case (selector)
		4'b0000: begin
			win<=0;
			finish<=0;
			done<=0;
			done2<=0;
			end
		default:begin
			win<=iwin;
			finish<=ifinish;
			done<=idone;
			done2<=idone2;
			end
		
	endcase

end
endmodule
