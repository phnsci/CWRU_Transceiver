transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_RX/src {C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_RX/src/shift_sampler.v}
vlog -vlog01compat -work work +incdir+C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_RX/src {C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_RX/src/sample_decoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_RX/src {C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_RX/src/HEX_display.v}
vlog -vlog01compat -work work +incdir+C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_RX/src {C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_RX/src/CWRU_Transceiver_RX.v}
vlog -vlog01compat -work work +incdir+C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_RX/src {C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_RX/src/clk_40_gen.v}

vlog -vlog01compat -work work +incdir+C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_RX/src {C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_RX/src/CWRU_Transceiver_RX_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  CWRU_Transceiver_RX_tb

add wave *
view structure
view signals
run -all
