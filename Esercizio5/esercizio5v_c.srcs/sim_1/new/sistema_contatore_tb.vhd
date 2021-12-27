----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.12.2021 15:17:39
-- Design Name: 
-- Module Name: sistema_contatore_tb - Behavioral
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

entity sistema_contatore_tb is
--  Port ( );
end sistema_contatore_tb;

architecture Behavioral of sistema_contatore_tb is
component sis Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           set : in STD_LOGIC;
           input: in std_logic_vector(1 to 17);
           output : out STD_LOGIC_VECTOR (1 to 17));
end component;
constant CLK_period : time := 10ns;
FOR ALL: sis USE ENTITY work.sistema_contatori( Structural);
signal clock,reset,set,ab : STD_LOGIC;
signal input,output : STD_LOGIC_VECTOR (1 to 17);
begin

sis_port: sis port map(clock=>clock,reset => reset, set => set, input => input, output => output);

clk: process
begin
    clock <= '0';
    wait for CLK_period/2;
    clock <= '1';
    wait for CLK_period/2;
end process;

sis_1: process
begin    
    reset <= '1';
    wait for CLK_period;
    reset <= '0';
    wait for CLK_period;
    wait for CLK_period;
    for i in 0 to 1000000000 loop
        wait for CLK_period;
    end loop;
end process;

end Behavioral;
