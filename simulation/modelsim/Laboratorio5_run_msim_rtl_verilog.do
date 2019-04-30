transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/user/Desktop/VGA-Controller {C:/Users/user/Desktop/VGA-Controller/clk_div.sv}
vlog -sv -work work +incdir+C:/Users/user/Desktop/VGA-Controller {C:/Users/user/Desktop/VGA-Controller/test.sv}

