@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Tue Jan 11 10:57:54 +0100 2022
REM SW Build 2552052 on Fri May 24 14:49:42 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto ead6c5d006eb46c0b197f8d7204e8b4a --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot AtoB_tb_behav xil_defaultlib.AtoB_tb -log elaborate.log"
call xelab  -wto ead6c5d006eb46c0b197f8d7204e8b4a --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot AtoB_tb_behav xil_defaultlib.AtoB_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0