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
logic clk1;
logic rst=0;
logic rstall=0;
logic start1;
logic select1;
logic hline_on;
logic vline_on;
logic sprite_on;
logic msg_on;
logic randReady;
logic win;
logic finish;
logic done;
logic done2;
logic win2;
logic finish2;
logic done21;
logic done22;
logic randReady2;
logic slc_on;
logic mux_sprite_out;
logic mux_msg_out;
logic [23:0] hline;
logic [23:0] vline;
logic [23:0] spr;
logic [23:0] msgr;
logic [23:0] ocuadrante;
logic [23:0] mux_out;
logic [2:0] seleccion;
logic [2:0] icuadrante;
logic [2:0] cuadranterandom;
logic [3:0] step;
logic [4:0] spr_color;
logic [1:0] msg_color;

antirrebote ant(clk,start,start1);
antirrebote ant1(clk,select,select1);

//mux_rst mrst(win,finish,done,done2,selector,win2,finish2,done21,done22);

clk_div nclk(clk,clk25);

counter ctn(~boton,rst,step,icuadrante);

random ran(clk,rst,step,cuadranterandom,randReady);

decodificador deco(seveSeg,cuadranterandom);

FSM fsm(clk,rst,start1,select1,win,randReady,done,done2,finish,step);

selector selectd(hline_on,vline_on,mux_sprite_out,mux_msg_out,slc_on,seleccion);

mux_sprite_state mxs(sprite_on,done,mux_sprite_out);

mux_msg_state msg(msg_on,done2,mux_msg_out);

mux_RGB dut(hline,vline,spr,msgr,ocuadrante,seleccion,mux_out);

Comparator comp(clk25,win,icuadrante,pixel_x,pixel_y,ocuadrante,slc_on);

new_clock nw(clk,rst,clk1);

cronometer crn(clk1,rst,step,done);
cronometer2 crn2(clk1,rst,step,done2);

hlineGenerator generator(clk25,win,pixel_x,pixel_y,hline_on,hline);

vlineGenerator generator2(clk25,win,pixel_x,pixel_y,vline_on,vline);

sprite sp(clk25,step,cuadranterandom,pixel_x,pixel_y,sprite_on,spr_color);

msg ms(clk25,step,pixel_x,pixel_y,msg_on,msg_color);

mux_RGB_msg(msg_color,msgr);

mux_RGB_spr mxsc(spr_color,spr);

selectionCompartor sc(clk,step,icuadrante,cuadranterandom,finish,win);

VGA_Controller controller(mux_out[23:16],mux_out[15:8],mux_out[7:0],oVGA_R,oVGA_G,oVGA_B,oVGA_H_SYNC,oVGA_V_SYNC,oVGA_SYNC,oVGA_BLANK,oVGA_CLK,clk25,rst,pixel_x,pixel_y);
endmodule
