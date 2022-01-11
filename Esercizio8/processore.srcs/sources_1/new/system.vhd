--------------------------------------------------------------------------VHDL--
-- Copyright (C) 2019 Alberto Moriconi
--
-- This program is free software: you can redistribute it and/or modify it under
-- the terms of the GNU General Public License as published by the Free Software
-- Foundation, either version 3 of the License, or (at your option) any later
-- version.
--
-- This program is distributed in the hope that it will be useful, but WITHOUT
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
-- FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
-- details.
--
-- You should have received a copy of the GNU General Public License along with
-- this program. If not, see <http://www.gnu.org/licenses/>.
--------------------------------------------------------------------------------
--! @file system.vhd
--! @author Alberto Moriconi
--! @date 2019-05-32
--! @brief A sample system based on amic-0
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.all;
use work.common_defs.all;

--! A sample system based on amic-0

--! The system contains the processor and a RAM
entity system is
  port (
    --! Clock
    clk            : in  std_logic;
    --! Synchronous active-high reset
    reset    : in  std_logic;
    --! Memory data output
    data_out : out std_logic_vector(7 downto 0) := (others => '0')
    );
end entity system;

-- Structural architecture for the system
architecture structural of system is
  component  Debouncer
     Port ( button : in STD_LOGIC;
           clock : in STD_LOGIC;
           cleared_button : out STD_LOGIC);
  end component;
  
  component  buffer_output
          Port ( mem_instr_in : in mbr_data_type;
            mem_data_out : in reg_data_type;
           reset : in std_logic;
           clock : in STD_LOGIC;
           data_out : out std_logic_vector(7 downto 0));
  end component;
  
  signal mem_data_we    : std_logic;
  signal mem_data_in    : reg_data_type;
  signal mem_data_out   : reg_data_type;
  signal mem_data_addr  : reg_data_type;
  signal mem_instr_in   : mbr_data_type;
  signal mem_instr_addr : reg_data_type;
  --signal reset_cleared: std_logic;  
  signal temp,temp2:std_logic_vector(7 downto 0);
begin -- architecture structural

  -- Processor instantiation
  processor : entity work.processor
    port map (
      clk            => clk,
      reset          => reset,
      mem_data_we    => mem_data_we,
      mem_data_in    => mem_data_in,
      mem_data_out   => mem_data_out,
      mem_data_addr  => mem_data_addr,
      mem_instr_in   => mem_instr_in,
      mem_instr_addr => mem_instr_addr);

  -- RAM instantiation
  dp_ar_ram : entity work.dp_ar_ram
    port map (
      clk        => clk,
      we_1       => mem_data_we,
      data_in_1  => mem_data_out,
      data_out_1 => mem_data_in,
      address_1  => mem_data_addr,
      we_2       => '0',
      data_in_2  => (others => '0'),
      data_out_2 => mem_instr_in,
      address_2  => mem_instr_addr);
      
--    deb1: debouncer port map(
--        button => reset,
--        clock => clk,
--        cleared_button => reset_cleared    
--    );
    
    buffer_out: buffer_output port map(
        mem_instr_in => mem_instr_in,
        mem_data_out   => mem_data_out,
        reset => reset,
        clock => clk,
        data_out => data_out    
    );
  
    
end architecture structural;
