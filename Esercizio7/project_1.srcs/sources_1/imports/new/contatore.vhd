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
    Generic( N:integer);
    Port ( clk : in STD_LOGIC;
           ris : in std_logic;
           div : out STD_LOGIC:= '0';
           count: out std_logic_vector ( 0 to integer( ceil( log2(real(N) ) ) )-1 ):=(others => '0')); 
end contatore;

architecture Behavioral of contatore is
signal count_temp: std_logic_vector (1 to integer( ceil( log2(real(N) ) ) )) := (others => '0'); 
type state is (q0,q1);
signal stato_corrente: state:= q0;
begin
    process(clk) 
    begin
        if( clk = '1' and clk'event) then
            case stato_corrente is
                when q0=> if(ris = '0') then stato_corrente <= q0; 
                           else stato_corrente <= q1; 
                                if ( count_temp = N-1) then
                                div <= '1';
                                count_temp <= (others => '0');
                                else
                                    div <= '0';
                                    count_temp<=count_temp+1;    
                                end if;   
                           end if;
                when q1=> if(ris = '1') then stato_corrente <= q1; 
                           else stato_corrente <= q0; end if;
                when others => stato_corrente <= q0;
             end case;
          end if;
    end process;
  count <= count_temp;
end Behavioral;
