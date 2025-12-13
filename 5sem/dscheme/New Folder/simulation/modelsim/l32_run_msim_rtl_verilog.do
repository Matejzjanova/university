transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/misha/VUZ/5sem/dscheme/New\ Folder {/home/misha/VUZ/5sem/dscheme/New Folder/d_l_ff.v}

