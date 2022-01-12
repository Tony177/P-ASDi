----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.01.2022 15:19:07
-- Design Name: 
-- Module Name: control_unitA - Behavioral
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

entity control_unitA is
    Port ( clk : in STD_LOGIC;
           div : in STD_LOGIC;
           ris : in STD_LOGIC;
           r : out STD_LOGIC:='0';
           reset : in STD_LOGIC;
           write : out STD_LOGIC:='0';
           TBE :  in STD_LOGIC);
end control_unitA;

architecture Behavioral of control_unitA is
type state is (q_start,q_trasmett,q0,q1,q2,q3);
signal current_state:state:=q_start;
signal temp_write: std_logic:='0';
begin
process(clk)
variable count:integer:=0;
begin
    if(clk='0' and clk'event) then
            case current_state is
               when q_start => if(reset = '1') then
                                    current_state <= q_trasmett;
                               else 
                                    current_state <= q_start;
                               end if;
               when q_trasmett => if(ris = '1') then
                                     current_state <= q_trasmett; 
                                  else
                                    current_state <= q0;    
                                    r <= '1';
                                  end if;
               when q0 =>   if( ris = '0') then
                                current_state <= q0;
                            else 
                                current_state <= q1;
                                r<= '0';
                            end if;
                            
               when q1 =>   temp_write <= '1';
                            current_state <= q2;
               
               when q2 =>    temp_write <= '0';
                             if(TBE = '1') then
                                    current_state <= q3;
                             else 
                                    current_state <= q2;
                             end if;
               
               when q3 =>   if(div = '0') then
                                current_state<= q_trasmett;
                             else
                                current_state<= q_start;
                             end if;
               when others => current_state <= q_start;
             end case;
           end if;
end process;
write <= temp_write;
end Behavioral;
