module top_test(
	input clk,
	input boton,start,select,
	output logic [7:0] oVGA_R,
	output logic [7:0] oVGA_G,
	output logic [7:0] oVGA_B,
	output logic oVGA_H_SYNC,
	output logic oVGA_V_SYNC,
	output logic oVGA_SYNC,
	output logic oVGA_BLANK,
	output logic oVGA_CLK,
	output [6:0] seveSeg
);

logic [9:0] pixel_x;
logic [9:0] pixel_y;
logic clk25;
logic rst=0;
logic win=0;
logic finish=0;
logic randReady;
logic done=1;
logic hline_on;
logic vline_on;
logic slc_on;
logic [23:0] hline;
logic [23:0] vline;
logic [23:0] ocuadrante;
logic [23:0] mux_out;
logic [2:0] seleccion;
logic [2:0] icuadrante;
logic [2:0] randnum;
logic [3:0] step;

clk_div nclk(clk,clk25);

counter ctn(~boton,rst,step,icuadrante);

random ran(clk,rst,step,randnum,randReady);

decodificador deco(seveSeg,randnum);

FSM fsm(clk,rst,start,select,win,randReady,done,finish,step);

selector selectd(hline_on,vline_on,0,0,slc_on,seleccion);

mux_RGB dut(hline,vline,0,0,ocuadrante,seleccion,mux_out);

Comparator comp(clk25,icuadrante,pixel_x,pixel_y,ocuadrante,slc_on);

hlineGenerator generator(clk25,win,pixel_x,pixel_y,hline_on,hline);

vlineGenerator generator2(clk25,win,pixel_x,pixel_y,vline_on,vline);

VGA_Controller controller(mux_out[23:16],mux_out[15:8],mux_out[7:0],oVGA_R,oVGA_G,oVGA_B,oVGA_H_SYNC,oVGA_V_SYNC,oVGA_SYNC,oVGA_BLANK,oVGA_CLK,clk25,rst,pixel_x,pixel_y);
endmodule
