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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gestore_set is
    Port ( clock,abModo : in STD_LOGIC;
           clr_button : in STD_LOGIC;
           dato : in STD_LOGIC_VECTOR (1 to 6);
           output : out STD_LOGIC_VECTOR (1 to 17):= (others=>'0');
           reset : in STD_LOGIC:= '0';
           set : out STD_LOGIC := '0';
           leds: out STD_LOGIC_VECTOR(2 downto 0)); --accendo un led DOPO ogni set di secondi,minuti,ore
end gestore_set;


-- count = 0->1 è lo stato di NON SET in cui fa il cronometro led "000"
-- count = 1->2 è lo stato iniziale di SET in cui ho settato i secondi led "001" (cioè la prima volta che premo il bottone di set sto settando i secondi e quindi devo gia inserire il val di secondi negli switch)
-- count = 2->3 lo stato in cui ho settato i minuti led "011"
-- count = 3->0 è lo stato in cui ho settato le ore led "111"

architecture Behavioral of gestore_set is

begin
    process ( clock)
    variable count: integer range 0 to 3:= 1; -- 0 non set, 1 imposta i secondi, 2 imposta i minuti, 3 imposta le ore
    begin
        if(clock = '1' and clock'event) then
        if(abModo='0') then
            if(reset = '1') then
                leds <= "000";
                set <= '0';
                output(1 to 17) <= (others => '0');
                count := 1;        --modifica Christian il count parte da 1 e non da 0    
                                 
            elsif(clr_button ='1') then
                set <= '1';
                if(count = 0) then
                    leds <= "000";
                    set <= '0';
                    count:= count +1;
                elsif(count = 1) then
                    leds <= "001";
                    if(unsigned(dato) <= 59) then   --se inserisco un numero maggiore di 59 allora considera l'ingresso come 00, così anche per gli altri input
                        output(1 to 6) <= dato(1 to 6) ;
                        output(7 to 17) <= (others => '0');
                    else
                        output <= (others => '0');  
                    end if;
                    count := count+1;
                elsif (count = 2) then
                    leds <= "011";
                    if(unsigned(dato) <= 59) then
                        output(7 to 12) <= dato(1 to 6);
                        output(13 to 17) <= (others => '0');
                    else
                        output(7 to 17) <= (others => '0');
                    end if;
                    count := count+1;
                elsif (count = 3) then
                    leds <= "111";
                    if(unsigned(dato) <= 23) then
                        output(13 to 17) <= dato(2 to 6);
                    else
                        output(13 to 17) <= (others => '0');
                    end if;
                    count := 0;
                end if;
            end if;
        end if;
        end if;
    end process;
end Behavioral;
