onerror {quit -f}
vlib work
vlog -work work PROCESSOR.vo
vlog -work work PROCESSOR.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.PROCESSOR_vlg_vec_tst
vcd file -direction PROCESSOR.msim.vcd
vcd add -internal PROCESSOR_vlg_vec_tst/*
vcd add -internal PROCESSOR_vlg_vec_tst/i1/*
add wave /*
run -all
