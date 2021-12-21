----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2021 11:57:19
-- Design Name: 
-- Module Name: conv_tb - Behavioral
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

entity conv_tb is
--  Port ( );
end conv_tb;

architecture Behavioral of conv_tb is
component conv_tb port ( input : in STD_LOGIC_VECTOR (1 to 17); -- ore - minuti - secondi
           output : out STD_LOGIC_VECTOR (1 to 32)); -- secondi - minuti - ore
end component;
FOR ALL: conv_tb use entity work.conv_per_display(Dataflow);
signal input: std_logic_vector(1 to 17);
signal output:  std_logic_vector(1 to 32);

begin
conv: conv_tb port map(input => input, output => output);

conv_1: process
begin
    wait for 10ns;
    input <= "001100" & "010001" & "00110";
    --input <= "10010010001000110";
    wait for 10ns;
    wait;
end process;        


end Behavioral;