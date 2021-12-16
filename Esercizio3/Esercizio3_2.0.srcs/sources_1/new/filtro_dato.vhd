----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2021 16:10:51
-- Design Name: 
-- Module Name: filtro_dato - Behavioral
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

entity filtro_dato is
    Port ( cleared_button : in STD_LOGIC;
           s1,clk : in STD_LOGIC;
           dato : out STD_LOGIC);
end filtro_dato;

architecture Behavioral of filtro_dato is

begin

filtro: process(clk)
begin
if(clk='1' and clk'event) then
    if( cleared_button = '1') then
        dato <= s1;
    else dato <= 'U';
   end if;
end if;
end process;
end Behavioral;
