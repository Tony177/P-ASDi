----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.01.2022 12:01:52
-- Design Name: 
-- Module Name: sistema_complessivo - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sistema_complessivo is
    Port ( 
        clk: in std_logic;
        enable: in std_logic_vector(0 to 3);
        start: in std_logic;
        data_in: in std_logic_vector(0 to 15);
        data_out: out std_logic_vector(0 to 7)
    );
end sistema_complessivo;

architecture Structural of sistema_complessivo is

component control_unit
    GENERIC ( N : integer:= 2);
    port(
        clk: in std_logic;
        enable: in std_logic_vector(0 to 3);
        start: in std_logic;
        data_in: in std_logic_vector(0 to (N+2)*4-1);
        data_out: out std_logic_vector(0 to 4*N-1);
        ind_source: out std_logic_vector(1 downto 0);
        ind_dest: out std_logic_vector(1 downto 0)
    );
end component;

component operative_unit
    GENERIC ( N : integer:= 2);
    port(
        ind_source: in std_logic_vector(1 downto 0);
        ind_dest: in std_logic_vector(1 downto 0);
        data_in: in std_logic_vector(0 to 4*N-1);
        data_out: out std_logic_vector(0 to 4*N-1)     
    );
end component;

signal temp_output: std_logic_vector(0 to 4*2-1);
signal ind_dest,ind_source: std_logic_vector(1 downto 0);
begin
  control:  
    control_unit port map(
        clk => clk,
        enable => enable,
        start =>start,
        data_in => data_in,
        data_out => temp_output,
        ind_source => ind_source,
        ind_dest => ind_dest
    );
   operative:  
    operative_unit port map(
        ind_source => ind_source,
        ind_dest => ind_dest,
        data_in => temp_output,
        data_out => data_out
    );   
end Structural;
