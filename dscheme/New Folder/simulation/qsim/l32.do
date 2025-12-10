onerror {exit -code 1}
vlib work
vlog -work work l32.vo
vlog -work work Waveform.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.d_l_ff_vlg_vec_tst
vcd file -direction l32.msim.vcd
vcd add -internal d_l_ff_vlg_vec_tst/*
vcd add -internal d_l_ff_vlg_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f



