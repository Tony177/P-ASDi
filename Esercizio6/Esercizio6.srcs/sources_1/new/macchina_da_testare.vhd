----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2021 17:16:13
-- Design Name: 
-- Module Name: macchina_da_testare - Behavioral
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

entity macchina_da_testare is
    Port ( ingresso : in STD_LOGIC_VECTOR (0 to 3);
           uscita : out STD_LOGIC_VECTOR (0 to 2));
end macchina_da_testare;

architecture Behavioral of macchina_da_testare is

begin
uscita (0 to 2) <= ingresso(1 to 3);

end Behavioral;
