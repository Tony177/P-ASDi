----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.12.2021 16:18:11
-- Design Name: 
-- Module Name: Arbitro - Behavioral
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

entity Arbitro is
    Port ( ingresso : in STD_LOGIC_VECTOR (0 to 9);
           uscita : out STD_LOGIC_VECTOR (0 to 9));
end Arbitro;

architecture Behavioral of Arbitro is

begin
uscita <= "1000000000" when ingresso(9)='1' else
          "0100000000" when ingresso(8)='1' else
          "0010000000" when ingresso(7)='1' else
          "0001000000" when ingresso(6)='1' else
          "0000100000" when ingresso(5)='1' else
          "0000010000" when ingresso(4)='1' else
          "0000001000" when ingresso(3)='1' else
          "0000000100" when ingresso(2)='1' else
          "0000000010" when ingresso(1)='1' else
          "0000000001" when ingresso(0)='1' else
          "----------";

end Behavioral;
