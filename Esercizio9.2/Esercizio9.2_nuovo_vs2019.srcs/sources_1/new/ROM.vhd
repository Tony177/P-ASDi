----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2021 12:50:23
-- Design Name: 
-- Module Name: ROM - Behavioral
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
use IEEE.math_real."log2";
use IEEE.math_real."ceil";
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Generic ( N: integer);
    Port ( output : out STD_LOGIC_VECTOR (7 downto 0):=(others => '0');
           read, clk: in STD_LOGIC ;
           count: in std_logic_vector ( 1 to integer( ceil( log2(real(N) ) ) ) )); 
end ROM;

architecture Behavioral of ROM is
type rom_type is array (0 to N-1) of std_logic_vector(7 downto 0);
signal ROM: rom_type:=("00011010", 
                       "00101010",
                       "00111010");
                       --"01001010");
signal temp: std_logic_vector(7 downto 0);
begin


mem: process(clk)
variable fine: integer:= integer(ceil(log2(real(N))));
begin
if(clk='1' and clk'event) then
    if(read ='1') then
        temp <= ROM(to_integer(unsigned(count(1 to fine))));
    end if;
  end if;
        
end process;

output <= temp;

end Behavioral;
