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
add_files /home/lv/VivadoProjects/nscscc_mips/func_test/soft/nodelay_ram_coe/inst_ram.coe
add_files /home/lv/VivadoProjects/nscscc_mips/func_test/soft/nodelay_ram_coe/data_ram.coe
read_verilog /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/MIPS/defines.h
set_property file_type "Verilog Header" [get_files /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/MIPS/defines.h]
read_verilog -library xil_defaultlib {
  /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/MIPS/LLbit.v
  /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/MIPS/ahb_bus_if.v
  /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/CONFREG/confreg.v
  /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/MIPS/cp0_reg.v
  /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/MIPS/ctrl.v
  /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/MIPS/div.v
  /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/MIPS/ex.v
  /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/MIPS/ex_mem.v
  /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/MIPS/hilo_reg.v
  /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/MIPS/id.v
  /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/MIPS/id_ex.v
  /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/MIPS/if_id.v
  /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/MIPS/mem.v
  /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/MIPS/mem_wb.v
  /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/MIPS/mips_top.v
  /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/MIPS/pc_reg.v
  /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/MIPS/regfile.v
  /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/AMBA/sramlike_to_ahb.v
  /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/TOP/soc_lite_top.v
}
read_ip -quiet /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/xilinx_ip/clk_pll/clk_pll.xci
set_property used_in_implementation false [get_files -all /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/xilinx_ip/clk_pll/clk_pll_board.xdc]
set_property used_in_implementation false [get_files -all /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/xilinx_ip/clk_pll/clk_pll.xdc]
set_property used_in_implementation false [get_files -all /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/xilinx_ip/clk_pll/clk_pll_ooc.xdc]

read_ip -quiet /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/xilinx_ip/inst_ram/inst_ram.xci
set_property used_in_implementation false [get_files -all /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/xilinx_ip/inst_ram/inst_ram_ooc.xdc]

read_ip -quiet /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/xilinx_ip/data_ram/data_ram.xci
set_property used_in_implementation false [get_files -all /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/xilinx_ip/data_ram/data_ram_ooc.xdc]

read_ip -quiet /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/xilinx_ip/ahblite_axi_bridge_0/ahblite_axi_bridge_0.xci
set_property used_in_implementation false [get_files -all /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/rtl/xilinx_ip/ahblite_axi_bridge_0/ahblite_axi_bridge_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/soc_lite.xdc
set_property used_in_implementation false [get_files /home/lv/VivadoProjects/nscscc_mips/func_test/soc/soc_lite_func_test/run_vivado/soc_lite.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top soc_lite_top -part xc7a200tfbg676-2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef soc_lite_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file soc_lite_top_utilization_synth.rpt -pb soc_lite_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
