transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/GitHub/quartus/t3 {D:/GitHub/quartus/t3/cpu.v}

vlog -vlog01compat -work work +incdir+D:/GitHub/quartus/t3/simulation/modelsim {D:/GitHub/quartus/t3/simulation/modelsim/cpu.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  cpu_vlg_tst

add wave *
view structure
view signals
run -all
