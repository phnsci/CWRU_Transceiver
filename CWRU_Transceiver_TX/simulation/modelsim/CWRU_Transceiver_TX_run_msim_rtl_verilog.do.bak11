transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_TX/src {C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_TX/src/code_shifter.v}
vlog -vlog01compat -work work +incdir+C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_TX/src {C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_TX/src/button_encoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_TX/src {C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_TX/src/HEX_display.v}
vlog -vlog01compat -work work +incdir+C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_TX/src {C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_TX/src/CWRU_Transceiver_TX.v}
vlog -vlog01compat -work work +incdir+C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_TX/src {C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_TX/src/clk_4_gen.v}
vlog -vlog01compat -work work +incdir+C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_TX/src {C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_TX/src/callsign.v}

vlog -vlog01compat -work work +incdir+C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_TX/src {C:/Users/Richard/OneDrive/Documents/GitHub/CWRU_Transceiver/CWRU_Transceiver_TX/src/CWRU_Transceiver_TX_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  CWRU_Transceiver_TX_tb

add wave *
view structure
view signals
run -all
