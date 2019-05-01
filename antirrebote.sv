module antirrebote(
		input logic clk,
		input logic btn_in,
		output logic btn_out
);
logic btn_prev=0;
logic [19:0] counter=20'b00000000000000000000;

always_ff @(posedge clk)
if ((btn_prev ^ btn_in)==1) begin 
		counter <= 0; 
		btn_prev <= btn_in;
	end
else if (counter[19] == 0) begin 
			counter <= counter + 1;
	end
else btn_out <= btn_prev;

endmodule


