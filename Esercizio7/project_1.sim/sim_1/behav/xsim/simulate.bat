@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Fri Jan 21 17:13:46 +0100 2022
REM SW Build 2902540 on Wed May 27 19:54:49 MDT 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim handshake_tb_behav -key {Behavioral:sim_1:Functional:handshake_tb} -tclbatch handshake_tb.tcl -view C:/Users/davide_420/Esercizio7completo/project_1.srcs/sim_1/imports/esercizio7/tesbenchA_behav.wcfg -log simulate.log"
call xsim  handshake_tb_behav -key {Behavioral:sim_1:Functional:handshake_tb} -tclbatch handshake_tb.tcl -view C:/Users/davide_420/Esercizio7completo/project_1.srcs/sim_1/imports/esercizio7/tesbenchA_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0