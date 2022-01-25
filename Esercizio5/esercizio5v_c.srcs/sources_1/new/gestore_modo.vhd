----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.12.2021 11:51:14
-- Design Name: 
-- Module Name: gestore_modo - Behavioral
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

entity gestore_modo is
    Port ( i_cronometro : in STD_LOGIC_VECTOR (1 to 32);
           i_intertempi : in STD_LOGIC_VECTOR (1 to 32);
           output : out STD_LOGIC_VECTOR (1 to 32);
           abModo:out std_logic;
           cleared_button : in STD_LOGIC;
           clk,reset: in STD_LOGIC);
end gestore_modo;

architecture Behavioral of gestore_modo is
signal temp : std_logic_vector(1 to 32);
signal tempModo: std_logic;
begin
process(clk)
variable modo: bit :='0';
begin
    if(clk='1' and clk'event) then
        if( reset = '1') then
            temp<= (others => '0');
            tempModo <='0';
            modo := '0';
        elsif( modo ='1') then
                tempModo<= '1';
                temp <= i_intertempi;
                if( cleared_button ='1') then
                    modo := '0';
                end if;
         else
            tempModo<='0';
            temp <= i_cronometro;
            if( cleared_button ='1') then
                modo := '1';
            end if;
        end if;
    end if;
end process;
output<= temp;
abModo <= tempModo;
end Behavioral;
