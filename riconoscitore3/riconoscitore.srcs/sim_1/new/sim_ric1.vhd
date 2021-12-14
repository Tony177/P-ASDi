----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2021 19:56:28
-- Design Name: 
-- Module Name: sim_ric1 - Behavioral
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

entity sim_ric1 is
--  Port ( );
end sim_ric1;

architecture Behavioral of sim_ric1 is
    signal d: std_logic := '0';
    signal CLK: std_logic := '1';
    
    signal u: std_logic := '0';
    signal a: std_logic := '1';
    constant CLK_period: time := 10ns;
    
begin
    utt: entity work.riconoscitore2 port map( --posso testare sia ric1 che ric2
        d,clk,a,u
    );
        
    proc: process
    begin
        wait for CLK_period;
        d <= '0';
        wait for CLK_period;
        d <= '1';
        wait for CLK_period;
        d <= '0';
        wait for CLK_period;
        d <= '0';
        wait for CLK_period;
        d <= '1';
         wait for CLK_period;
        d <= '0';
        wait for CLK_period;
        d <= '1';
        wait for CLK_period;
        d <= '0';
        wait for CLK_period;
        d <= '0';
        wait for CLK_period;
        d <= '1';
         wait for CLK_period;
        d <= '0';
        wait for CLK_period;
        d <= '1';
        wait for CLK_period;
        d <= '0';
        wait for CLK_period;
        d <= '0';
        wait for CLK_period;
        d <= '1';
        wait;
    end  process proc;
    
    clk_process: process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;
end Behavioral;
