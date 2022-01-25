----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.01.2022 11:26:37
-- Design Name: 
-- Module Name: ff_bidirezionale - Behavioral
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

entity ffd_bidirezionale is
    Port ( leftInput, rightInput, clk, reset : in STD_LOGIC;
           mode, a: in bit:='0';
           output : out STD_LOGIC);
end ffd_bidirezionale;

architecture Behavioral of ffd_bidirezionale is
signal temp: std_logic;
begin

delta: process(clk)
     begin
        if(clk='1' and clk'event) then
           if(reset='1') then 
                temp <= '0';
            elsif(a='1') then
                if(mode ='0') then
                    temp <= rightInput;
                else
                    temp <= leftInput;
                end if;
            end if;
        end if; 
     end process;
output <= temp;
end Behavioral;

