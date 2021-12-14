----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2021 21:40:21
-- Design Name: 
-- Module Name: gestore_ric - Behavioral
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

entity gestore_ric is
    port(
        clk,rst,m: in std_logic;
        u: out std_logic_vector(0 to 1)
    );
end gestore_ric;

architecture Behavioral of gestore_ric is
    type state is (q0,q1,q2);
    signal stato_corrente: state:= q0;
begin
    process(clk)
    begin 
        if(clk ='1' and clk'event) then
            u <= "00";
            case stato_corrente is
            when q0 =>  if(rst = '1') then stato_corrente <= q0; u <= "00"; 
                        else 
                            if( m = '0' and rst = '0') then stato_corrente <= q1;  u <= "10"; 
                            else  stato_corrente <= q2;  u <= "01"; 
                            end if;
                        end if; 
            when q1 =>  if(rst = '0') then stato_corrente <= q1;  u <= "10"; else stato_corrente <= q0; u <= "00"; end if; 
            when q2 =>  if(rst = '0') then stato_corrente <= q2;  u <= "01"; else stato_corrente <= q0; u <= "00"; end if; 
            end case;
        end if;
    end process;
end Behavioral;

