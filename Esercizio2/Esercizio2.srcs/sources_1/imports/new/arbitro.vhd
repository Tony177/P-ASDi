----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2021 15:58:09
-- Design Name: 
-- Module Name: arbitro - Behavioral
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

entity arbitro is
    Port ( 
        x: in std_logic_vector(9 downto 0);
        y: out std_logic_vector(9 downto 0)
    );
end arbitro;

architecture dataflow of arbitro is

begin
        y <= "1000000000" when x(9) = '1' else
             "0100000000" when x(8) = '1' else
             "0010000000" when x(7) = '1' else
             "0001000000" when x(6) = '1' else
             "0000100000" when x(5) = '1' else
             "0000010000" when x(4) = '1' else
             "0000001000" when x(3) = '1' else
             "0000000100" when x(2) = '1' else
             "0000000010" when x(1) = '1' else
             "0000000001" when x(0) = '1' else
             "----------"; --soluzione alternativa : se alzo piu linee si disattivano tutte e resta la linea 0 alta

end dataflow;
