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
    Generic (N: integer := 2);
    Port ( output: out STD_LOGIC_VECTOR (0 to 4*N-1);
           source : in STD_LOGIC_VECTOR (0 to 1);
           input : in STD_LOGIC_VECTOR(0 to N-1));
end demux_4_1;

architecture Behavioral of demux_4_1 is
signal temp: std_logic_vector(0 to N-1) := (others => '0');
begin
    output <= input & temp & temp & temp when source="00" else
              temp & input & temp & temp when source="01" else
              temp & temp & input & temp  when source="10" else
              temp & temp & temp & input when source="11" else
              (others => '0');
              
end Behavioral;
