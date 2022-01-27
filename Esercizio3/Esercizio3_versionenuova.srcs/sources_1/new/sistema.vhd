----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2021 15:32:04
-- Design Name: 
-- Module Name: sistema - Behavioral
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

entity sistema is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC := '0';
           I, CBD: in STD_LOGIC;
           M : in STD_LOGIC := '1';
           Y : out STD_LOGIC);
end sistema;

architecture Behavioral of sistema is
type STATUS is (S0, S1, S2, S3, S4, S5, S6, S7);
SIGNAL MODE : STD_LOGIC := '1';
SIGNAL PS : STATUS;

begin

delta : process (clk) 
begin 
if ( CLK = '1' and CLK'event) then
    if ( RESET = '1') then
         PS <= S0;
        if(M = '1') then
            MODE <= '1';
        else
            MODE <= '0';
        end if;
    elsif(CBD = '1') then
        if (MODE = '1') then
            case PS is
                when S0 | S4 =>
                    if ( I = '0') then
                        PS <= S0;
                    else 
                        PS <= S1;
                    end if;
                 when S1 =>
                    if ( I = '0') then
                        PS <= S2;
                    else
                        PS <= S1;
                    end if;
                 when S2 =>
                    if ( I = '0') then
                        PS <= S3;
                    else
                        PS <= S1;
                    end if;
                 when S3 =>
                    if ( I = '0') then
                        PS <= S0;
                    else
                        PS <= S4;
                    end if;
                 when others =>
                    PS <= S0; -- Error
                    
            end case;
          else 
             case PS is
                when S0 | S4 =>
                    if ( I = '0') then
                        PS <= S5;
                    else
                        PS <= S1;
                    end if;
                 when S1 =>
                    if ( I = '0') then
                        PS <= S2;
                    else
                        PS <= S6;
                    end if;
                 when S2 =>
                    if ( I = '0') then
                        PS <= S3;
                    else
                        PS <= S7;
                    end if;
                  when S3 =>
                    if ( I = '0') then
                        PS <= S0;
                    else
                        PS <= S4;
                    end if;
                  when S5 =>
                        PS <= S6;
                  when S6 =>
                        PS <= S7;
                 when S7=>
                        PS <= S0;
                 when others =>
                        PS <= S0; -- Error         
            end case;
         end if;     
      end if;
    end if;
end process;

with PS select
    Y <= '1' when S4,
         '0' when others;
    
end Behavioral;
