----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.01.2022 15:47:24
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sim_sistema is
--  Port ( );
end sim_sistema;

architecture Behavioral of sim_sistema is
component sistema_complessivo is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           write: in std_logic);
end component;
constant clk_period : time := 1ns;
signal write, clk, reset: std_logic:='0';
signal inputA, outputB: STD_LOGIC_VECTOR (7 downto 0):= (others => '0');

begin
sys: sistema_complessivo port map(clk => clk, reset => reset, input => inputA, output => outputB, write => write);

clk_proc:    process
            begin
                clk <= '1';
                wait for clk_period/2;
                clk <= '0';
                wait for clk_period/2;
            end process;

proc_sim:   process
            begin
                reset <= '1';
                wait for clk_period*12;
                reset <= '0';
                wait for clk_period*30;
                inputA <= "01001010";
                wait for clk_period;
                write <= '1';
                wait for clk_period*32;
                write <= '0';
                wait for clk_period;
                wait;
            end process;


end Behavioral;
