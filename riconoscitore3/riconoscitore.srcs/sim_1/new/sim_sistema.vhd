----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.12.2021 13:00:56
-- Design Name: 
-- Module Name: sim_sistema - Behavioral
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

entity sim_sistema is
--Port ( );
end sim_sistema;

architecture Behavioral of sim_sistema is
    signal d: std_logic := '0';
    signal clk: std_logic := '1';
    signal rst: std_logic := '1';
    signal m: std_logic := '0';
    signal u: std_logic := '0';
    
    constant CLK_period: time := 10ns;
    
begin
    utt: entity work.sistema port map(
        d => d,
        clk => clk,
        rst => rst,
        m => m,
        u => u
    );
    process
    begin
        wait for CLK_period;
        m <= '0';               --riconoscitore1
        wait for CLK_period;
        rst <= '0';             --vado nello stato q1 del gestore
        
        -------sim_ric1
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
        wait for 2*CLK_period;
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
        wait for 4*CLK_period;
        -------------           --passo al modo = 1
        rst <= '1';
        wait for CLK_period;    
        m <= '1';
        wait for CLK_period;
        rst <= '0';
        
        --------
        --sim_ric2
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
        d <= '0';
        wait for 2*CLK_period;
        d <= '0';
        wait for CLK_period;
        d <= '1';
        wait;
    end process;
    
    clk_proc : process
        begin
        wait for CLK_period;
        clk <= '0';
        wait for CLK_period;
        clk <= '1';
    end process;
end Behavioral;
