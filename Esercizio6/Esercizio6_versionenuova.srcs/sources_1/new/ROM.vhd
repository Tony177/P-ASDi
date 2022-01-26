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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Generic ( N: integer);
    Port ( output : out STD_LOGIC_VECTOR (0 to 3);
           read, clk: in STD_LOGIC );
end ROM;

architecture Behavioral of ROM is
type rom_type is array (0 to N-1) of std_logic_vector(0 to 3);
signal ROM: rom_type:=("1100",
                       "0111",
                       "0001",
                       "1110");
signal temp: std_logic_vector(0 to 3);
begin


mem: process(clk)
variable count: integer :=0;
begin
if(clk='0' and clk'event) then
    if(read ='1') then
        temp <= ROM(count);
        count:= (count+1) mod N;
    end if;
  end if;
        
end process;

output <= temp;

end Behavioral;
