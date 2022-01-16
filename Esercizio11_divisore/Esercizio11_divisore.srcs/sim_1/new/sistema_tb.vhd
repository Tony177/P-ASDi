----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.01.2022 12:11:27
-- Design Name: 
-- Module Name: sistema_tb - Behavioral
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

entity sistema_tb is
--  Port ( );
end sistema_tb;

architecture Behavioral of sistema_tb is
component divisore is
     generic( N: integer := 4);  --(N è la lunghezza del dividendo, M è la lunghezza del divisore)
     port(
            clk:in std_logic;
            start: in std_logic;
            reset: in std_logic;
            input_dividendo: in std_logic_vector(N-1 downto 0); 
            input_divisore: in std_logic_vector(N-1 downto 0); 
            output: out std_logic_vector(2*N-1 downto 0) --op1 resto,op2 quoz
        );
end component;
constant CLK_period : time := 0.1ns;
signal clk,start, reset: std_logic := '0';
signal input_dividendo:  std_logic_vector(3 downto 0); 
signal input_divisore:  std_logic_vector(3 downto 0); 
signal output:  std_logic_vector(7 downto 0);

begin
    entita: divisore port map(
            clk => clk,
            start => start,
            reset => reset,
            input_dividendo => input_dividendo,
            input_divisore => input_divisore,
            output => output
            );
clk_proc: process
    begin
        clk <= '0';
        wait for CLK_period/2;
        clk <= '1';
        wait for CLK_period/2;
    end process;

input_dividendo <= "1000";
input_divisore <= "0011";

sis_1: process
        begin
          wait for 10ns;
          reset <= '1';
          wait for CLK_period;
          reset <= '0';
          wait for 10ns;
          start <= '1';
          wait for CLK_period;
          start <= '0';
          wait for 200ns;
          reset <= '1';
          wait for CLK_period;
          reset <= '0';
          wait for 10ns;
          start <= '1';
          wait for CLK_period;
          start <= '0';
         wait;
     end process;

end Behavioral;
