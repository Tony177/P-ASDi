----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.12.2021 18:20:46
-- Design Name: 
-- Module Name: conv_bit_integer - Behavioral
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
use IEEE.NUMERIC_STD.ALL; -- per to_integer()

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity conv_per_display is
    Port ( input : in STD_LOGIC_VECTOR (1 to 17); -- secondi - minuti - ore
           output : out STD_LOGIC_VECTOR (1 to 32)); -- secondi - minuti - ore
end conv_per_display;
architecture Dataflow of conv_per_display is
    signal ore,minuti,secondi : integer; 

begin
    ore <=to_integer(unsigned(input(13 to 17)));
    minuti <= to_integer(unsigned(input(7 to 12)));
    secondi <= to_integer(unsigned(input(1 to 6)));

-- Utilizziamo questa sintassi per le decine perchè il tipo real non è sintetizzabile, quindi non è possibile utilizzare la funzione "floor"    
    output(29 to 32) <= std_logic_vector(to_unsigned(natural(secondi mod 10),4)); -- unita secondi
    output(25 to 28) <= std_logic_vector(to_unsigned(natural((secondi - secondi mod 10)/10),4)); -- decina secondi
    output(21 to 24) <= std_logic_vector(to_unsigned(natural(minuti mod 10),4)); -- unita minuti
    output(17 to 20) <= std_logic_vector(to_unsigned(natural((minuti - minuti mod 10)/10),4)); -- decina minuti
    output(13 to 16) <= std_logic_vector(to_unsigned(natural(ore mod 10),4)); -- unita ore
    output(9 to 12) <= std_logic_vector(to_unsigned(natural((ore - ore mod 10)/10),4)); -- decina ore
    output(1 to 8) <= (others => '0');
    
end Dataflow;


