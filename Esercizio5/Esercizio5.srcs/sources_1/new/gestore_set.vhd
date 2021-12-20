----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.12.2021 16:55:05
-- Design Name: 
-- Module Name: gestore_set - Behavioral
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

entity gestore_set is
    Port ( clock : in STD_LOGIC;
           clr_button : in STD_LOGIC;
           dato : in STD_LOGIC_VECTOR (1 to 6);
           output : out STD_LOGIC_VECTOR (1 to 17):= (others=>'0');
           set : out STD_LOGIC := '0');
end gestore_set;

architecture Behavioral of gestore_set is

begin
    process ( clock)
    variable count: integer range 0 to 3:= 0; -- 0 imposta i secondi, 1 imposta i minuti, 2 imposta le ore, 3 per evitare bug modulo
    begin
        if(clock = '1' and clock'event) then
            if(clr_button ='1') then
                set <= '1';
                if(count = 0) then
                    output(1 to 6) <= dato(1 to 6);
                    count := count+1;
                elsif (count = 1) then
                    output(7 to 12) <= dato(1 to 6);
                    count := count+1;
                elsif (count = 2) then
                    output(13 to 17) <= dato(2 to 6);
                    count := 0;
                    set <= '0';
                end if;
            end if;
        end if;
    end process;

end Behavioral;
