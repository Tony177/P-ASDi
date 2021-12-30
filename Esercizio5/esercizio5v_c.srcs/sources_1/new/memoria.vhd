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
           abModo: in STD_LOGIC; -- se è in intertempo non deve poter salvare valori (1 intertempo, 0 cronometro)
           clk : in STD_LOGIC;
           read,write : in STD_LOGIC);
end memoria;

architecture Behavioral of memoria is
type memoria_type is array (0 to N-1) of std_logic_vector(1 to 32);
signal mem: memoria_type;
begin
memo: process(clk)
variable countInput,countOutput: integer range 0 to N-1:=0;
    begin   
        if(clk='1' and clk'event) then
            if(reset ='1') then 
                countInput:=0;
                countOutput:=0;
                for i in 0 to N-1 loop
                    mem(i)<=(others => '0');
                end loop;
                output <= (others => '0');
            elsif( write='1' and abModo = '0') then
                mem(countInput)<= input;
                countInput:= (countInput+1) mod N; 
            elsif(abModo = '1') then
                output <= mem(countOutput);
                if(read='1') then           --solo se sono in modalita intertempo devo scorrere i valori in memoria
                    countOutput:= (countOutput +1) mod N;
                end if;
            else  
                countOutput:=0;
            end if; 
         end if;               
    end process;
 end Behavioral;