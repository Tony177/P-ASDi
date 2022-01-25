----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2021 17:18:25
-- Design Name: 
-- Module Name: tester_tb - Behavioral
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

entity tester_tb is
--  Port ( );
end tester_tb;

architecture Structural of tester_tb is

component sistema  Port ( clk : in STD_LOGIC;
                                    read,reset : in STD_LOGIC;
                                    led: out STD_LOGIC_VECTOR (0 to 2));
end component;


constant CLK_period : time := 10 ns;
signal clk,read,reset: std_logic :='0';
signal led:  STD_LOGIC_VECTOR (0 to 2);
begin

sist_utt: sistema port map( clk => clk, read => read, reset=> reset,led => led);

clock : process
  begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 testing: process
    begin
     wait for 100ns;
    reset <= '1';
    wait for 100ns;
    reset <= '0';
    wait for 10ns;
    
    read <= '1';
    wait for 10ns;
    read <= '0';
    
--    wait for 100ns;
    
--    reset <= '0';
--    wait for 100ns;
--    reset <= '0';
    
--    wait for 100ns;
    
--    read <= '1';
--    wait for 10ns;
--    read <= '0';
    
--    wait for 100ns;
    
--    read <= '0';
--    wait for 10ns;
--    read <= '0';
    
--    wait for 200ns;
    
--    read <= '1';
--    wait for 10ns;
--    read <= '0';
    
--    wait for 100ns;
     
--    read <= '1';
--    wait for 10ns;
--    read <= '0';
    
    wait for 500ns;
     
    read <= '1';
    wait for 10ns;
    read <= '0';
--    read <= '1';
--    wait for 50ns;
--    write <= '1';
--    wait for 70ns;
--    write <= '0';
--    wait for 20ns;
--    read <= '0';
--    wait for 110ns;
--    write <= '1';
--    wait for 50ns;
--    write <= '0';
--    wait for 75ns;
--    write <= '1';
--    wait for 25ns;
--    write <= '0';
--    wait for 10ns;
--    write <= '1';
--    wait for 50ns;
--    write <= '0';
--    wait for 10ns;
--    write <= '1';
--    wait for 50ns;
--    write <= '0';
--    wait for 300ns;
    wait;
    end process;

end Structural;
