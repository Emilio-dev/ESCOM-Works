set_global_assignment -entity "PLL" -library "lib_PLL" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "PLL" -library "lib_PLL" -name IP_TOOL_VERSION "21.1"
set_global_assignment -entity "PLL" -library "lib_PLL" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_PLL" -name SPD_FILE [file join $::quartus(sip_path) "../PLL.spd"]
set_global_assignment -library "lib_PLL" -name MISC_FILE [file join $::quartus(sip_path) "../../PLL.qsys"]

set_global_assignment -library "lib_PLL" -name MISC_FILE [file join $::quartus(sip_path) "PLL.v"]
set_global_assignment -library "lib_PLL" -name MISC_FILE [file join $::quartus(sip_path) "submodules/PLL_altpll_0.vo"]
