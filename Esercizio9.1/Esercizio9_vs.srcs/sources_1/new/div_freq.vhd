----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.01.2022 15:42:36
-- Design Name: 
-- Module Name: div_freq - Behavioral
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

entity div_freq is
    generic ( N : integer := 16);
    Port ( clk : in STD_LOGIC;
           clk_out : out STD_LOGIC := '0');
end div_freq;

architecture Behavioral of div_freq is
signal temp : std_logic;
begin
process(clk)
variable count : integer:=0;
begin
    if(clk = '1' and clk'event) then
        if( count < N/2) then
            temp <= '0';
        elsif(count >= N/2 and count < N) then
            temp <= '1';
        end if;
        count := count +1;
        if(count = N) then
            count :=0;
         end if;
    end if;
end process;
clk_out <= temp;

end Behavioral;
