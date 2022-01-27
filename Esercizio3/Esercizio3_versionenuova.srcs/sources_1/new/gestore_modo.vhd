----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2021 16:30:23
-- Design Name: 
-- Module Name: gestore_modo - Behavioral
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

entity gestore_modo is
    Port ( b2 : in STD_LOGIC;
           s2 : in STD_LOGIC;
           clk : in STD_LOGIC;
           modo : out STD_LOGIC);
end gestore_modo;

architecture Structural of gestore_modo is
component db PORT(button : in STD_LOGIC;
           clk : in STD_LOGIC;
           cleared_button : out STD_LOGIC);
end component;

for all: db use entity work.debouncer(Behavioral);

component fm PORT(cleared_button : in STD_LOGIC;
           s2,clk : in STD_LOGIC;
           modo : out STD_LOGIC);
end component;

for all: fm use entity work.filtro_modo(Behavioral);


signal cb_temp: std_logic;

begin

db2: db PORT MAP(button => b2, clk => clk, cleared_button => cb_temp);

fm1: fm PORT MAP(cleared_button => cb_temp, clk => clk, s2 => s2, modo => modo);

end Structural;
