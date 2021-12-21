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
use IEEE.math_real."floor";

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL; -- per to_integer()

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity conv_bit_integer is
    Port ( input : in STD_LOGIC_VECTOR (1 to 17); -- secondi - minuti - ore
           output : out STD_LOGIC_VECTOR (1 to 32)); -- secondi - minuti - ore
end conv_bit_integer;
architecture Dataflow of conv_bit_integer is
    signal ore,minuti,secondi : integer; 

begin
    ore <=to_integer(unsigned(input(13 to 17)));
    minuti <= to_integer(unsigned(input(7 to 12)));
    secondi <= to_integer(unsigned(input(1 to 6)));

    output(25 to 32) <= (others => '0');
    output(21 to 24) <= std_logic_vector(to_unsigned(natural(floor(real(ore/10))),4)); -- decina ore
    output(17 to 20) <= std_logic_vector(to_unsigned(natural(ore mod 10),4)); -- unita ore
    output(13 to 16) <= std_logic_vector(to_unsigned(natural(floor(real(minuti/10))),4)); -- decina minuti
    output(9 to 12) <= std_logic_vector(to_unsigned(natural(minuti mod 10),4)); -- unita minuti
    output(5 to 8) <= std_logic_vector(to_unsigned(natural(floor(real(secondi/10))),4)); -- decina secondi
    output(1 to 4) <= std_logic_vector(to_unsigned(natural(secondi mod 10),4)); -- unita secondi
    
end Dataflow;
