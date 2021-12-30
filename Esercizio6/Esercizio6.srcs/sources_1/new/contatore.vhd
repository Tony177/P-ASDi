----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.12.2021 14:00:29
-- Design Name: 
-- Module Name: contatore - Behavioral
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
-- use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real."log2";
use IEEE.math_real."ceil";
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity contatore is
    Generic( N:positive);
    Port ( clock : in STD_LOGIC;
           div : out STD_LOGIC); 
end contatore;

architecture Behavioral of contatore is

begin
process (clock)
variable count: integer:=0;
    begin   
        if( clock = '1' and clock'event) then
            --div <= '0';
                if ( count = N-1) then
                    div <= '1';
                    count:=0;
                else
                    div <= '0';
                    count:=count+1;    
                end if;                    
        end if;
    end process;
    --output <= tmp;
end Behavioral;
