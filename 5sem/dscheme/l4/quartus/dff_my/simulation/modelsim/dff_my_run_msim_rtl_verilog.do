transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/misha/VUZ/5sem/dscheme/l4/quartus/dff_my {/home/misha/VUZ/5sem/dscheme/l4/quartus/dff_my/dff_my.v}

