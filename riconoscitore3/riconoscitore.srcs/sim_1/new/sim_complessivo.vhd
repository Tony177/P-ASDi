----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.12.2021 22:32:59
-- Design Name: 
-- Module Name: sim_complessivo - Behavioral
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

entity sim_complessivo is
--  Port ( );
end sim_complessivo;

architecture Behavioral of sim_complessivo is
        signal b1,b2,s1,s2,clk:  std_logic := '0';
        signal led:  std_logic := '0';
        constant  CLK_period: time := 10 ns;
begin
     utt: entity work.sistema_completo port map(
        b1 => b1,
        b2 => b2,
        s1 => s1,
        s2 => s2,
        clk => clk,
        led => led
    );
    
    process 
    begin
        wait for CLK_period;
        b2 <= '1';
        wait for 3*CLK_period;
        s2 <= '1';
        wait for 3*CLK_period;
        b2 <= '0';
        wait for CLK_period;
        s2 <= '0';
        wait for 4*CLK_period;
        b2 <= '1';
        wait for 6*CLK_period;
        b2 <= '0';
        wait;
    end process;
    
    clk_proc : process
        begin
        
        clk <= '0';
        wait for CLK_period;
        clk <= '1';
        wait for CLK_period;
    end process;
end Behavioral;
