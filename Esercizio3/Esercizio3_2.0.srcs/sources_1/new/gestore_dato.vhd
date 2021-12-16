----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2021 15:36:17
-- Design Name: 
-- Module Name: gestore_dato - Behavioral
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

entity gestore_dato is
    Port ( b1 : in STD_LOGIC;
           s1,clk : in STD_LOGIC;
           dato : out STD_LOGIC);
end gestore_dato;

architecture structural of gestore_dato is

component deb PORT ( button : in STD_LOGIC;
                  clk : in STD_LOGIC;
                  cleared_button : out STD_LOGIC);
end component;

for all: deb use entity work.debouncer(Behavioral);
signal cb_temp: std_logic;

component fd PORT (cleared_button : in STD_LOGIC;
           s1,clk : in STD_LOGIC;
           dato : out STD_LOGIC);
end component;
for all: fd use entity work.filtro_dato(Behavioral);

begin

db1: deb PORT MAP( button => b1, clk => clk, cleared_button => cb_temp);

fd1: fd PORT MAP(clk => clk, cleared_button => cb_temp, s1 => s1, dato => dato);


end structural;
