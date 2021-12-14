----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.12.2021 16:51:04
-- Design Name: 
-- Module Name: demux_4_1 - Behavioral
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

entity demux_4_1 is
    Port ( input : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (0 to 3);
           enable : in STD_LOGIC_VECTOR (0 to 1));
end demux_4_1;

architecture Behavioral of demux_4_1 is
begin
    output <= input&"000" when enable="00" else
              '0'&input&"00" when enable="01" else
              "00"&input&'0' when enable="10" else
              "000"&input when enable="11" else
              "----";
              
end Behavioral;
