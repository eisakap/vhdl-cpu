onerror {quit -f}
vlib work
vlog -work work FINALPROCESSOR.vo
vlog -work work FINALPROCESSOR.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.FINALPROCESSOR_vlg_vec_tst
vcd file -direction FINALPROCESSOR.msim.vcd
vcd add -internal FINALPROCESSOR_vlg_vec_tst/*
vcd add -internal FINALPROCESSOR_vlg_vec_tst/i1/*
add wave /*
run -all
