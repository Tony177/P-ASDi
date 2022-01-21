----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2022 11:31:26
-- Design Name: 
-- Module Name: control_unit - Behavioral
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
use ieee.std_logic_arith.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_unit is
    Generic(M:positive);
    Port ( ab_control : in STD_LOGIC := '0';
           ab_interfaccia : out STD_LOGIC := '0';
           DataIn : in std_logic_vector(0 to M-1):=(others=> '0');
           read : out STD_LOGIC:='0';
           write : out STD_LOGIC:='0';
           Data_y : in std_logic_vector(0 to M-1):=(others=> '0');
           Data_sum : out std_logic_vector(0 to M-1);
           clk : in STD_LOGIC);
end control_unit;

architecture Behavioral of control_unit is
type state is (q0,q1,q2,q3,q4,q5);
signal stato_corrente: state:= q0;
signal a,b: unsigned(0 to M-1):=(others =>'0');
signal temp_read,temp_write: std_logic:='0';
signal sum_temp: unsigned(0 to M-1):= (others =>'0');
begin

process(clk)
begin
if(clk='1' and clk'event) then
  case stato_corrente is
    when q0 => if(ab_control ='0') then 
                    stato_corrente <= q0;
               else 
                    stato_corrente <= q1;
                    ab_interfaccia<='0';
               end if;
               
    when q1 => temp_read <= '1';
               stato_corrente <= q2;
               
    when q2 => temp_read <= '0';
               stato_corrente <= q3;
               
    when q3 => a <= unsigned(DataIn);
               b <= unsigned(Data_y);
               stato_corrente <= q4;
               ab_interfaccia<='1';
               
    when q4 =>  sum_temp <= (a + b);
                temp_write<='1'; 
                ab_interfaccia<='0';
                stato_corrente <= q5;
                              
    when q5 =>  temp_write<='0'; 
                if(ab_control ='0') then 
                    stato_corrente <= q5;
                 else 
                    stato_corrente <= q1;
                end if;
                
    when others => stato_corrente <= q0;
  end case;
end if;
end process;
read <= temp_read;
write <= temp_write;
Data_sum <= std_logic_vector(sum_temp(0 to M-1));
end Behavioral;
