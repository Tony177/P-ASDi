----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.01.2022 17:46:58
-- Design Name: 
-- Module Name: testbench - Behavioral
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

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is
    component sistema_complessivo is
    Port ( 
        clk: in std_logic;
        enable: in std_logic_vector(0 to 3);
        start: in std_logic;
        data_in: in std_logic_vector(0 to 15);
        data_out: out std_logic_vector(0 to 7)
    );
    end component;
    
      signal  clk:  std_logic;
      signal  enable:  std_logic_vector(0 to 3) := (others => '0');
      signal  start:  std_logic:='0';
      signal  data_in:  std_logic_vector(0 to 15):= (others => '0');
      signal  data_out:  std_logic_vector(0 to 7):= (others => '0');
      constant CLK_PERIOD: time := 10ns;
      
begin
    sist_comp: sistema_complessivo port map(
        clk => clk,
        enable => enable,
        start => start,
        data_in => data_in,
        data_out => data_out
    );
    
    clk_proc: process
    begin
        clk <= '0';
        wait for CLK_period/2;
        clk <= '1';
        wait for CLK_period/2;
    end process;

      
    sis_proc:process
    begin   
        enable <= "1111";
        data_in(0 to 3) <= "1010" ; --prima linea vuole comunicare con 2 e dato= 2
        data_in(4 to 7) <= "0011";
        data_in(8 to 11) <= "0000";
        data_in(12 to 15) <= "1111";
        start <= '1';    
        wait for CLK_period;
        start <= '0';
        wait;    
    end process;
    
end Behavioral;
