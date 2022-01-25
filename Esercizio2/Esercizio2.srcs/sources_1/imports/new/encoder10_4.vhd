----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.11.2021 13:03:06
-- Design Name: 
-- Module Name: encoder10_4 - Behavioral
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

entity encoder10_4 is
    Port ( 
        x: in std_logic_vector(9 downto 0);
        y: out std_logic_vector(3 downto 0)
    );
end encoder10_4;

architecture dataflow of encoder10_4 is

begin
       with x select
            y <= "0000" when "0000000001",
                 "0001" when "0000000010",
                 "0010" when "0000000100",
                 "0011" when "0000001000",
                 "0100" when "0000010000",
                 "0101" when "0000100000",
                 "0110" when "0001000000",
                 "0111" when "0010000000",
                 "1000" when "0100000000",
                 "1001" when "1000000000",
                 "----" when others; --se alzo piu linee si disattivano tutte e resta la linea 0 alta
                 
end dataflow;
