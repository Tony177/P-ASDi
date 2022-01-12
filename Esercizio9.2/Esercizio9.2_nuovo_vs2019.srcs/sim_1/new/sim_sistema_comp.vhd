----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.01.2022 17:35:14
-- Design Name: 
-- Module Name: sim_sistema_comp - Behavioral
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

entity sim_sistema_comp is
--  Port ( );
end sim_sistema_comp;

architecture Behavioral of sim_sistema_comp is
component sistema_complessivo is
    Port (
           output : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           read: in std_logic;
           div_out: out std_logic);
end component;
signal output: STD_LOGIC_VECTOR (7 downto 0);

signal clk, reset ,read ,div_out: std_logic;
constant CLK_PERIOD: time := 1ns;

begin
    utt: sistema_complessivo port map(output => output, clk => clk, reset => reset, read => read, div_out =>div_out);

    proc_clk: process
    begin
        clk <= '1';
        wait for CLK_PERIOD/2;
        clk <= '0';
        wait for CLK_PERIOD/2;
    end process;
    
    process
        begin
        reset<='1';
        wait for 20 ns;
        reset <= '0';
        wait for 700ns;
        read <= '1';
        wait for 2 ns;
        read <= '0';
        wait for 2ns;
        read <= '1';
        wait for 2 ns;
        read <= '0';
        wait;
        
        end process;
end Behavioral;
