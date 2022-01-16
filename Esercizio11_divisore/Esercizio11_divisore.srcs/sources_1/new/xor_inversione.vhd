----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2022 16:00:32
-- Design Name: 
-- Module Name: xor_inversione - Behavioral
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

entity xor_inversione is
    Generic ( M : integer:= 4);
    Port ( 
          -- clock : in STD_LOGIC;
           input1 : in STD_LOGIC_VECTOR (M-1 downto 0); 
           input2 : in std_logic:='0'; 
           output : out STD_LOGIC_VECTOR (M-1 downto 0)
          );
   
end xor_inversione;

architecture Behavioral of xor_inversione is

begin
    output <= input1 xor (others => input2);        --non so se funziona
end Behavioral;
