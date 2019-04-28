module FSM (
	input clk,rst,start,boton,select,win,randReady,done,finish,
	output [3:0] step,
	output [1:0] cuadrante
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
	4'b0000: begin
	if(start) begin 
		next_state = 4'b0001; 
		cuadrante <= 2'bxx;
		end
		else begin
			next_state = 4'b0000; 
			cuadrante <= 2'bxx;
		end
	end
	4'b0001:begin
	if(randReady && done) begin
		next_state = 4'b0011;
		cuadrante <= 2'bxx;
		end
	else if(randReady && done==0) begin
		next_state = 4'b0010;
		cuadrante <= 2'bxx;
		end
	else begin
		next_state = 4'b0001; 
		cuadrante <= 2'bxx;
		end
	end
	4'b0010:begin
	if(done) begin
		next_state = 4'b0001;
		cuadrante <= 2'bxx;
		end
	else if(select) begin
		next_state = 4'b0111;
		cuadrante <= 2'bxx;
		end
	else begin
		next_state = 4'b0010; 
		cuadrante <= 2'bxx;
		end
	end
	4'b0011:begin
	if(boton) begin
		next_state = 4'b0100;
		cuadrante <= 2'bxx;
		end
	else if(select) begin
		next_state = 4'b0010;
		cuadrante <= 2'b00;//cuadrante #1
		end
	else begin
		next_state = 4'b0011; 
		cuadrante <= 2'bxx;
		end
	end
	4'b0100:begin
	if(boton) begin
		next_state = 4'b0101;
		cuadrante <= 2'bxx;
		end
	else if(select) begin
		next_state = 4'b0010;
		cuadrante <= 2'b01;//cuadrante #2
		end
	else begin
		next_state = 4'b0100; 
		cuadrante <= 2'bxx;
		end
	end
	4'b0101:begin
	if(boton) begin
		next_state = 4'b0110;
		cuadrante <= 2'bxx;
		end
	else if(select) begin
		next_state = 4'b0010;
		cuadrante <= 2'b10;//cuadrante #3
		end
	else begin
		next_state = 4'b0101; 
		cuadrante <= 2'bxx;
		end
	end
	4'b0110:begin
	if(boton) begin
		next_state = 4'b0011;
		cuadrante <= 2'bxx;
		end
	else if(select) begin
		next_state = 4'b0010;
		cuadrante <= 2'b11;//cuadrante #4
		end
	else begin
		next_state = 4'b0110; 
		cuadrante <= 2'bxx;
		end
	end
	4'b0111:begin
	if(finish) begin
		next_state = 4'b0000;
		cuadrante <= 2'bxx;
		end
	else if(win) begin
		next_state = 4'b1000;
		cuadrante <= 2'bxx;
		end
	else begin
		next_state = 4'b0111; 
		cuadrante <= 2'bxx;
		end
	end
	4'b1000:begin
	if(finish) begin
		next_state = 4'b0000;
		cuadrante <= 2'bxx;
		end
	else begin
		next_state = 4'b1000;
		cuadrante <= 2'bxx;
		end
	end
	default: begin
		next_state = 4'b0000;
		cuadrante <= 2'bxx;
	end
	endcase
end
assign step = state;
endmodule
