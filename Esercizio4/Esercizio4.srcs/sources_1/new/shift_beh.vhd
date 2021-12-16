----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2021 14:39:24
-- Design Name: 
-- Module Name: shift_beh - Behavioral
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

entity shift_beh is
    generic ( X : integer :=8 );
    Port ( clock : in std_logic;
           direction : in bit:= '0'; --0 sinistra, 1 destra
           reset : in std_logic:='0';
           input : in std_logic;
           u : out std_logic_vector(0 to X); 
           ab: in bit;
           Y: in integer);
end shift_beh;

architecture Behavioral of shift_beh is
signal reg: std_logic_vector ( 0 to X);

begin
main: process (clock)
begin
    if (clock = '1' and clock'event) then
        if ( reset = '1') then
           reg <= (others => '0');
        else
            if( ab = '1') then
                if ( direction = '1' ) then
                    for i in 0 to Y loop
                        reg(0 to X) <= input & reg(0 to X-1); 
                    end loop;
                else
                    for i in 0 to Y loop
                        reg(0 to X) <= reg(1 to X) & input;
                    end loop;
                end if;
            end if;
        end if;
    end if;
end process;

u <= reg;

end Behavioral;
