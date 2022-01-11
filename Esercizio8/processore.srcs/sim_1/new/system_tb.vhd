----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.01.2022 16:01:40
-- Design Name: 
-- Module Name: system_tb - Behavioral
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
use work.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity system_tb is
--  Port ( );
end system_tb;

architecture Behavioral of system_tb is
component system is
  port (
    --! Clock
    clk            : in  std_logic;
    --! Synchronous active-high reset
    reset    : in  std_logic;
    --! Memory data output
    data_out : out std_logic_vector(7 downto 0)
    );
end component;
    signal clk,reset: std_logic;
    signal data_out:  std_logic_vector(7 downto 0);
    constant CLK_period: time:= 10ns;
begin
tb1:  system port map( clk => clk,reset => reset,data_out=> data_out );

proc_clk: process
    begin
        clk <= '1';
        wait for CLK_period/2;
        clk <= '0';
        wait for CLK_period/2;
    end process;
--00011001 00111110 10101001 00111000 01011100 
process_reset: process
    begin
    reset <='1';
    wait for 20ns;
    reset <='0';
    wait for 500ns;
    reset <='1';
    wait for 20ns;
    reset <='0';
    wait;

    end process;

end Behavioral;
