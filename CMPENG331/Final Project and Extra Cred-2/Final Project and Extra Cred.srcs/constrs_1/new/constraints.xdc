## Clock Signal (125 MHz on Zybo Z7)
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { clk }]; 
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { clk }];

## ----------------------------------------------------------------------------
## LEDs - Map wbData[3:0] to LEDs (Visible Output)
## ----------------------------------------------------------------------------
set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { wbData[0] }]; 
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { wbData[1] }]; 
set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { wbData[2] }]; 
set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { wbData[3] }]; 

## ----------------------------------------------------------------------------
## DUMMY MAPPINGS - Map wbData[31:4] to Pmod Headers
## This satisfies the requirement that ALL ports must be constrained.
## ----------------------------------------------------------------------------

## Pmod Header JE
set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { wbData[4] }]; 
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports { wbData[5] }]; 
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { wbData[6] }]; 
set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { wbData[7] }]; 
set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports { wbData[8] }]; 
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { wbData[9] }]; 
set_property -dict { PACKAGE_PIN T17   IOSTANDARD LVCMOS33 } [get_ports { wbData[10] }]; 
set_property -dict { PACKAGE_PIN Y17   IOSTANDARD LVCMOS33 } [get_ports { wbData[11] }]; 

## Pmod Header JD
set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { wbData[12] }]; 
set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { wbData[13] }]; 
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { wbData[14] }]; 
set_property -dict { PACKAGE_PIN R14   IOSTANDARD LVCMOS33 } [get_ports { wbData[15] }]; 
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { wbData[16] }]; 
set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33 } [get_ports { wbData[17] }]; 
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { wbData[18] }]; 
set_property -dict { PACKAGE_PIN V18   IOSTANDARD LVCMOS33 } [get_ports { wbData[19] }]; 

## Pmod Header JC
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { wbData[20] }]; 
set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33 } [get_ports { wbData[21] }]; 
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { wbData[22] }]; 
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { wbData[23] }]; 
set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33 } [get_ports { wbData[24] }]; 
set_property -dict { PACKAGE_PIN Y14   IOSTANDARD LVCMOS33 } [get_ports { wbData[25] }]; 
set_property -dict { PACKAGE_PIN T12   IOSTANDARD LVCMOS33 } [get_ports { wbData[26] }]; 
set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { wbData[27] }]; 

## Pmod Header JB (Partial)
set_property -dict { PACKAGE_PIN T20   IOSTANDARD LVCMOS33 } [get_ports { wbData[28] }]; 
set_property -dict { PACKAGE_PIN U20   IOSTANDARD LVCMOS33 } [get_ports { wbData[29] }]; 
set_property -dict { PACKAGE_PIN V20   IOSTANDARD LVCMOS33 } [get_ports { wbData[30] }]; 
set_property -dict { PACKAGE_PIN W20   IOSTANDARD LVCMOS33 } [get_ports { wbData[31] }];