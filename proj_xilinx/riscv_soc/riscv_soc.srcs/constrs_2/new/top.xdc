# The physical oscillator is 50MHz; clk_wiz_0 generates the 100MHz CPU clock.
create_clock -period 20.000 -name sys_clk -waveform {0.000 10.000} [get_ports clk]

set_property PACKAGE_PIN U18 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports led]
set_property IOSTANDARD LVCMOS33 [get_ports raw_rst_n]
set_property PACKAGE_PIN T10 [get_ports led]
set_property PACKAGE_PIN T19 [get_ports raw_rst_n]

set_property LOAD 5 [get_ports tx]
set_property LOAD 5 [get_ports led]

set_property PACKAGE_PIN P15 [get_ports tx]
set_property IOSTANDARD LVCMOS33 [get_ports tx]


