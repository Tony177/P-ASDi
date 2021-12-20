----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.12.2021 16:12:29
-- Design Name: 
-- Module Name: wait_block - Behavioral
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

entity wait_block is
    Port ( clock: in STD_LOGIC;
           x : in STD_LOGIC;
           y : out STD_LOGIC);
end wait_block;

architecture Behavioral of wait_block is
signal tmp: STD_LOGIC := '0';
begin
process (clock)
begin
    if ( clock = '1' and clock'event) then 
        tmp<=x;
    end if;
end process;
y<=tmp;

end Behavioral;
