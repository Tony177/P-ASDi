

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2022 15:39:39
-- Design Name: 
-- Module Name: registro - Behavioral
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

entity registroV is
    generic( N: integer:= 4); --per AQ 4,4 oer V 4, -1
    port(
        clk:in std_logic;
        reset: in std_logic;
        start: in std_logic;
        input: in std_logic_vector(N-1 downto 0); 
        output: out std_logic_vector(N-1 downto 0)
    );


end registroV;

architecture Behavioral of registroV is
signal temp_reg: std_logic_vector(N-1 downto 0) := (others => '0');
begin
proc_reg: process(clk)
    begin
        if(clk = '1' and clk'event) then
            if(reset = '1') then
                temp_reg <= (others => '0');
            elsif(start = '1') then
                temp_reg <= input(N-1 downto 0);    --scrivo gli N bit relativi al dividendo parziale con il dividendo iniziale
           end if;
        end if;
    end process;
output <= temp_reg;
end Behavioral;
