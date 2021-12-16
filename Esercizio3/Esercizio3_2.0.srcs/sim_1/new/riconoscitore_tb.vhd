----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2021 11:18:36
-- Design Name: 
-- Module Name: riconoscitore_tb - Behavioral
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

entity riconoscitore_tb is
--  Port ( );
end riconoscitore_tb;

architecture structural of riconoscitore_tb is
component ric PORT (b1,b2,s1,s2,clk,reset : in STD_LOGIC;
           u : out STD_LOGIC);
end component;

for all: ric use entity WORK.riconoscitore(Structural);

signal clk :  STD_LOGIC;
signal reset :  STD_LOGIC;
signal b1,b2,s1,s2 :  STD_LOGIC;
signal u:  STD_LOGIC;

constant CLK_period : time := 10 ns;

begin

ric1: ric PORT MAP( clk => clk, reset => reset, s1 => s1, b1 => b1,s2 => s2, b2 => b2, u => u);

clock : process
  begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
   
   
bottone_dato : process
    begin  
           b1 <= '1';
		   wait for CLK_period;
		   b1 <= '0';
		   wait for CLK_period*2;
   end process;
    
sequenza : process
    begin 
    s1 <= '0';
    b2 <= '1';
    wait for 7 ns;	
     
      s2<='1';
      b2 <= '0';
      wait for 11 ns;
      RESET <= '0';
      wait for 7 ns;
      s2<='0';
      
      wait for CLK_period*10;

      -- insert stimulus here 
		s1<='0';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		reset<='1';
		wait for 15 ns;   --usato per testare il comportamento con il reset
		reset<='0';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='0';
		wait for 15 ns;
		s1<='1';
		wait for 15 ns;
		s1<='0';
        
		
      wait;
   end process;

end Structural;
