----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.12.2021 11:31:32
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

entity memoria is
    Generic( N:integer);
    Port ( input : in STD_LOGIC_VECTOR (1 to 32);
           output : out STD_LOGIC_VECTOR (1 to 32);
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           read,write : in STD_LOGIC);
end memoria;

architecture Behavioral of memoria is
type rom_type is array (N downto 1) of std_logic_vector(1 to 32);
signal Rom: rom_type;
begin
mem: process(clk)
variable countInput,countOutput: integer range 1 to N:=1;
    begin   
        if(clk='1' and clk'event) then
            if(reset ='1') then 
                countInput:=1;
                countOutput:=1;
                for i in 1 to N loop
                    Rom(i)<=(others => '0');
                end loop;
            elsif( write='1') then
                Rom(countInput)<= input;
                countInput:= (countInput+1) mod N;
            elsif(read='1') then
                output <= Rom(countOutput);
                countOutput:= (countOutput +1) mod N;
            end if; 
         end if;               
    end process;
 end Behavioral;