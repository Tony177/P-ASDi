#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.2 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Wed Dec 08 17:36:50 CET 2021
# SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# elaborate design
echo "xelab -wto 57c8c77fa7d34cc4a114592abccb2fec --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot rete_tb_behav xil_defaultlib.rete_tb -log elaborate.log"
xelab -wto 57c8c77fa7d34cc4a114592abccb2fec --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot rete_tb_behav xil_defaultlib.rete_tb -log elaborate.log

