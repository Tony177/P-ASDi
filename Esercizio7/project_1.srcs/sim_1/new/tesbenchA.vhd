----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.12.2021 16:37:33
-- Design Name: 
-- Module Name: tesbenchA - Behavioral
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

entity tesbenchA is
--  Port ( );
end tesbenchA;

architecture Behavioral of tesbenchA is
component sistemaA 
   generic(N: positive:= 4; M: positive:= 4);
    Port ( r : out STD_LOGIC;
           clk : in std_logic;
           ris : in STD_LOGIC;
           data : out STD_LOGIC_VECTOR(0 to M-1));
   end component;
   constant CLK_period : time := 10ns;
   signal r,clk,ris : STD_LOGIC := '0';
   signal data :  STD_LOGIC_VECTOR(0 to 4-1);
   
begin
    entita: sistemaA port map(clk => clk, r => r, ris => ris, data => data);
    
    clk_proc: process
    begin
        clk <= '0';
        wait for CLK_period/2;
        clk <= '1';
        wait for CLK_period/2;
    end process;

sis_1: process
        begin   
         wait for 50ns;
         ris <= '1';
         wait for 50ns;
         ris <= '0';
         wait for 50ns;
         ris <= '1';
         wait for 50ns;
         ris <= '0';
         wait for 50ns;
         ris <= '1';
         wait for 50ns;
         ris <= '0';
         wait for 50ns;
         ris <= '1';
         wait for 50ns;
         ris <= '0';
         wait;
        end process;

    
    

end Behavioral;
