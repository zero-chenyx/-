set_property -dict {PACKAGE_PIN H4 IOSTANDARD LVCMOS33} [get_ports clk_100MHz]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk_100MHz]

set_property PACKAGE_PIN C3 [get_ports {key_1}]
set_property PACKAGE_PIN M4 [get_ports {key_2}]
set_property PACKAGE_PIN J1 [get_ports {led_1}]
set_property PACKAGE_PIN A13 [get_ports {led_2}]
set_property PACKAGE_PIN F4 [get_ports {TMDS_Tx_Clk_N}]
set_property PACKAGE_PIN G4 [get_ports {TMDS_Tx_Clk_P}]
set_property PACKAGE_PIN F1 [get_ports {TMDS_Tx_Data_N[0]}]
set_property PACKAGE_PIN G1 [get_ports {TMDS_Tx_Data_P[0]}]
set_property PACKAGE_PIN D2 [get_ports {TMDS_Tx_Data_N[1]}]
set_property PACKAGE_PIN E2 [get_ports {TMDS_Tx_Data_P[1]}]
set_property PACKAGE_PIN C1 [get_ports {TMDS_Tx_Data_N[2]}]
set_property PACKAGE_PIN D1 [get_ports {TMDS_Tx_Data_P[2]}]


set_property IOSTANDARD LVCMOS33 [get_ports {key_1}]
set_property IOSTANDARD LVCMOS33 [get_ports {key_2}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_1}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_2}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_Tx_Clk_N}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_Tx_Clk_P}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_Tx_Data_N[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_Tx_Data_P[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_Tx_Data_N[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_Tx_Data_P[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_Tx_Data_N[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_Tx_Data_P[2]}]

set_property PULLDOWN true [get_ports {led_1}]
set_property PULLDOWN true [get_ports {led_2}]
set_property PULLUP true [get_ports {key_1}]
set_property PULLUP true [get_ports {key_2}]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]