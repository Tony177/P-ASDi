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
    Port ( input : in STD_LOGIC_VECTOR (1 to 17); -- ore - minuti - secondi
           output : out STD_LOGIC_VECTOR (1 to 32)); -- secondi - minuti - ore
end conv_bit_integer;

architecture Dataflow of conv_bit_integer is
    constant ore : integer := to_integer(unsigned(input(12 to 17)));
    constant minuti: integer := to_integer(unsigned(input(6 to 12)));
    constant secondi: integer := to_integer(unsigned(input(1 to 6)));

begin

    output(25 to 32) <= (others => '0');
    output(20 to 24) <= floor(real(ore/10));
    
end Dataflow;
