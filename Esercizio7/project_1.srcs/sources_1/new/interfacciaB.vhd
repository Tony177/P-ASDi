----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2022 10:30:38
-- Design Name: 
-- Module Name: interfacciaB - Behavioral
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

entity interfacciaB is
    Generic( M: positive);
    Port ( clk : in STD_LOGIC;
           r : in STD_LOGIC;
           ris : out STD_LOGIC;
           DataIn : in STD_LOGIC_VECTOR (0 to M-1) := (others =>'0');
           DataOut : out STD_LOGIC_VECTOR (0 to M-1):= (others =>'0');
           div : in STD_LOGIC;
           ab_control : out STD_LOGIC := '0';
           ab_interfaccia : in STD_LOGIC := '0');
end interfacciaB;

architecture Behavioral of interfacciaB is
type state is (q0,q1,q2,q3,q4);
signal stato_corrente: state:= q0;
signal ris_temp,temp_ab_control : std_logic := '0';
signal temp_dataIn:STD_LOGIC_VECTOR (0 to M-1):= (others =>'0');
begin
process(clk)
begin
if(clk='1' and clk'event) then
 case stato_corrente is
    when q0 => if(r='0') then 
                    stato_corrente <= q0;
               else 
                    stato_corrente <= q1;
                    temp_ab_control <= '1';
                    ris_temp<= '1';
                    temp_dataIn <= DataIn;
               end if;
      when q1 => if(ab_interfaccia='0') then 
                   stato_corrente <= q1;
               else
                   temp_ab_control <= '0';
                   stato_corrente <= q2;
                        
               end if;
      when q2 => if (r='0') then
                      ris_temp <= '0';
                      stato_corrente <= q3;
                    else
                       stato_corrente <= q2;
                    end if;
      when q3 => if(div='0') then 
                   stato_corrente <= q4;
                 else 
                    stato_corrente <= q0;
                 end if;           
      when q4 => if(r='0') then 
                   stato_corrente <= q4;
                 else 
                   stato_corrente <= q1;
                   temp_ab_control<= '1';
                   ris_temp<= '1';
                 end if;
      when others => stato_corrente <= q0;
 end case;
end if;
end process;

ab_control <= temp_ab_control;
DataOut <= DataIn;
ris <= ris_temp;
end Behavioral;
