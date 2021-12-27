----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2021 15:54:30
-- Design Name: 
-- Module Name: memoria - Behavioral
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
    Generic( N: integer);
    Port ( input : in STD_LOGIC_VECTOR (0 to 2);
           output : out STD_LOGIC_VECTOR (0 to 2);
           reset, read, write : in STD_LOGIC;
           clk : in STD_LOGIC);
end memoria;

architecture Behavioral of memoria is
type mem_type is array (0 to N-1) of std_logic_vector(0 to 2);
signal mem: mem_type;
signal tempout, tempin: std_logic_vector (0 to 2);
begin
memoria: process(clk)
variable countInput,countOutput: integer range 0 to N-1:=0;
    begin   
        if(clk='1' and clk'event) then
          if(reset ='1') then 
                countInput:=0;
                countOutput:=0;
                for i in 0 to N-1 loop
                    mem(i)<=(others => '0');
                end loop;
            elsif(read='1') then
                mem(countInput) <= input;
                countInput:= (countInput+1) mod N;
            elsif(write='1') then
                output <= mem(countOutput);
                countOutput:= (countOutput +1) mod N;
            end if; 
         end if;               
    end process;
--output <= tempout;
--tempin <= input;
end Behavioral;
