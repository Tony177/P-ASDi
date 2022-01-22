----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.01.2022 10:45:54
-- Design Name: 
-- Module Name: control_unitB - Behavioral
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

entity control_unitB is
    Port ( RDA : in STD_LOGIC;
           ris,error : out STD_LOGIC:='0';
           r, PE, FE: in STD_LOGIC:='0';
           write, RD : out STD_LOGIC:='0';
           clk : in STD_LOGIC);
end control_unitB;

architecture Behavioral of control_unitB is
type state is(q_start,q0,q1);
signal current_state: state:=q_start;
signal temp_write:std_logic:= '0';

begin
process(clk)
begin
    if(clk='0' and clk'event) then
        case current_state is
            when q_start => if(r = '0') then
                               current_state <= q_start;
                            else
                                 current_state <= q0;
                                 ris <= '1';
                            end if;
            when q0 => if(RDA = '1') then
                            RD <= '1';
                            if(PE = '1' or FE = '1') then
                                current_state <= q1;
                                error <= '1';
                            else 
                                temp_write <= '1'; 
                                current_state <= q1;
                                error<= '0';
                            end if;
                        else 
                            current_state <= q0;
                        end if;
            when q1 =>  temp_write <= '0';
                        RD <= '0';
                        if(r = '0') then
                            current_state <= q_start;
                            ris <= '0';
                        else  
                            current_state <= q1;
                        end if; 
            when others => current_state <= q0;
            end case; 
    end if;
end process;
write <= temp_write;
end Behavioral;
