# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param project.vivado.isBlockSynthRun true
set_msg_config -msgmgr_mode ooc_run
create_project -in_memory -part xc7a200tfbg676-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.cache/wt [current_project]
set_property parent.project_path /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_ip -quiet /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/xilinx_ip/clk_pll/clk_pll.xci
set_property used_in_implementation false [get_files -all /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/xilinx_ip/clk_pll/clk_pll_board.xdc]
set_property used_in_implementation false [get_files -all /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/xilinx_ip/clk_pll/clk_pll.xdc]
set_property used_in_implementation false [get_files -all /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/xilinx_ip/clk_pll/clk_pll_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 0

set cached_ip [config_ip_cache -export -no_bom -use_project_ipc -dir /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.runs/clk_pll_synth_1 -new_name clk_pll -ip [get_ips clk_pll]]

if { $cached_ip eq {} } {
close [open __synthesis_is_running__ w]

synth_design -top clk_pll -part xc7a200tfbg676-2 -mode out_of_context

#---------------------------------------------------------
# Generate Checkpoint/Stub/Simulation Files For IP Cache
#---------------------------------------------------------
# disable binary constraint mode for IPCache checkpoints
set_param constraints.enableBinaryConstraints false

catch {
 write_checkpoint -force -noxdef -rename_prefix clk_pll_ clk_pll.dcp

 set ipCachedFiles {}
 write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ clk_pll_stub.v
 lappend ipCachedFiles clk_pll_stub.v

 write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ clk_pll_stub.vhdl
 lappend ipCachedFiles clk_pll_stub.vhdl

 write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ clk_pll_sim_netlist.v
 lappend ipCachedFiles clk_pll_sim_netlist.v

 write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ clk_pll_sim_netlist.vhdl
 lappend ipCachedFiles clk_pll_sim_netlist.vhdl

 config_ip_cache -add -dcp clk_pll.dcp -move_files $ipCachedFiles -use_project_ipc -ip [get_ips clk_pll]
}

rename_ref -prefix_all clk_pll_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef clk_pll.dcp
create_report "clk_pll_synth_1_synth_report_utilization_0" "report_utilization -file clk_pll_utilization_synth.rpt -pb clk_pll_utilization_synth.pb"

if { [catch {
  write_verilog -force -mode synth_stub /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.runs/clk_pll_synth_1/clk_pll_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.runs/clk_pll_synth_1/clk_pll_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.runs/clk_pll_synth_1/clk_pll_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.runs/clk_pll_synth_1/clk_pll_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}


} else {


}; # end if cached_ip 

add_files /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.runs/clk_pll_synth_1/clk_pll_stub.v -of_objects [get_files /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/xilinx_ip/clk_pll/clk_pll.xci]

add_files /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.runs/clk_pll_synth_1/clk_pll_stub.vhdl -of_objects [get_files /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/xilinx_ip/clk_pll/clk_pll.xci]

add_files /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.runs/clk_pll_synth_1/clk_pll_sim_netlist.v -of_objects [get_files /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/xilinx_ip/clk_pll/clk_pll.xci]

add_files /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.runs/clk_pll_synth_1/clk_pll_sim_netlist.vhdl -of_objects [get_files /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/xilinx_ip/clk_pll/clk_pll.xci]

add_files /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.runs/clk_pll_synth_1/clk_pll.dcp -of_objects [get_files /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/xilinx_ip/clk_pll/clk_pll.xci]

if {[file isdir /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.ip_user_files/ip/clk_pll]} {
  catch { 
    file copy -force /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.runs/clk_pll_synth_1/clk_pll_sim_netlist.v /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.ip_user_files/ip/clk_pll
  }
}

if {[file isdir /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.ip_user_files/ip/clk_pll]} {
  catch { 
    file copy -force /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.runs/clk_pll_synth_1/clk_pll_sim_netlist.vhdl /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.ip_user_files/ip/clk_pll
  }
}

if {[file isdir /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.ip_user_files/ip/clk_pll]} {
  catch { 
    file copy -force /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.runs/clk_pll_synth_1/clk_pll_stub.v /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.ip_user_files/ip/clk_pll
  }
}

if {[file isdir /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.ip_user_files/ip/clk_pll]} {
  catch { 
    file copy -force /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.runs/clk_pll_synth_1/clk_pll_stub.vhdl /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/project_1/project_1.ip_user_files/ip/clk_pll
  }
}
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]