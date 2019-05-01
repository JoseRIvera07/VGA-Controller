module FSM (
	input clk,rst,start,select,win,randReady,done,finish,
	output [3:0] step
);
logic [3:0] next_state;
logic [3:0] state;

always_ff @(posedge clk, posedge rst) begin
	if(rst) begin
		state<= 4'b0000;
		end
	else begin
		state <= next_state;
		end
end

//combinational logic
always_comb begin
	case(state)
	4'b0000: 
	begin
		if(start) next_state = 4'b0001; 
		else next_state = 4'b0000; 
	end
	4'b0001:
	begin
		if(randReady && done) next_state = 4'b0011;
		else if(randReady && done==0) next_state = 4'b0010;
		else next_state = 4'b0001; 
	end
	4'b0010:
	begin
		if(select && done) next_state = 4'b0111;
		else if(done && select==0) next_state = 4'b0001;
		else next_state = 4'b0010; 
	end
	4'b0011:
	begin
		if(select) next_state = 4'b0010;
		else next_state = 4'b0011;
	end
	4'b0111:
	begin
		if(finish) next_state = 4'b0000;
		else if(win) next_state = 4'b1000;
		else next_state = 4'b0111; 
	end
	4'b1000:
	begin
		if(finish) next_state = 4'b0000;
		else next_state = 4'b1000;
	end
	default: next_state = 4'b0000;

	endcase
end
assign step = state;
endmodule
