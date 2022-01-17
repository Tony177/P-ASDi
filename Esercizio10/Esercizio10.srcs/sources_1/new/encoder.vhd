----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.01.2022 12:32:34
-- Design Name: 
-- Module Name: encoder - Behavioral
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

entity encoder is
    Port ( 
            input: in std_logic_vector(0 to 3);
            output: out std_logic_vector(0 to 1)
        );
end encoder;

architecture Behavioral of encoder is

begin
    output <= "00" when input(0) = '1' else
              "01" when input(1) = '1' else
              "10" when input(2) = '1' else
              "11" when input(3) = '1' else  
              "--";
        

end Behavioral;
