# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
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
set_param chipscope.maxJobs 3
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a50ticsg324-1L

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/super/Desktop/magistrale/architetture/progettiVHDL/processore/processore.cache/wt [current_project]
set_property parent.project_path C:/Users/super/Desktop/magistrale/architetture/progettiVHDL/processore/processore.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:nexys-a7-50t:part0:1.0 [current_project]
set_property ip_output_repo c:/Users/super/Desktop/magistrale/architetture/progettiVHDL/processore/processore.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/super/Desktop/magistrale/architetture/progettiVHDL/processore/processore.srcs/sources_1/new/common_defs.vhd
  C:/Users/super/Desktop/magistrale/architetture/progettiVHDL/processore/processore.srcs/sources_1/new/alu.vhd
  C:/Users/super/Desktop/magistrale/architetture/progettiVHDL/processore/processore.srcs/sources_1/new/buffer_output.vhd
  C:/Users/super/Desktop/magistrale/architetture/progettiVHDL/processore/processore.srcs/sources_1/new/control_store.vhd
  C:/Users/super/Desktop/magistrale/architetture/progettiVHDL/processore/processore.srcs/sources_1/new/control_unit.vhd
  C:/Users/super/Desktop/magistrale/architetture/progettiVHDL/processore/processore.srcs/sources_1/new/datapath.vhd
  C:/Users/super/Desktop/magistrale/architetture/progettiVHDL/processore/processore.srcs/sources_1/new/dp_ar_ram.vhd
  C:/Users/super/Desktop/magistrale/architetture/progettiVHDL/processore/processore.srcs/sources_1/new/processor.vhd
  C:/Users/super/Desktop/magistrale/architetture/progettiVHDL/processore/processore.srcs/sources_1/new/system.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/super/Desktop/magistrale/architetture/progettiVHDL/processore/processore.srcs/constrs_1/imports/davide_420/Nexys-A7-50T-Master.xdc
set_property used_in_implementation false [get_files C:/Users/super/Desktop/magistrale/architetture/progettiVHDL/processore/processore.srcs/constrs_1/imports/davide_420/Nexys-A7-50T-Master.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top system -part xc7a50ticsg324-1L


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef system.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file system_utilization_synth.rpt -pb system_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
