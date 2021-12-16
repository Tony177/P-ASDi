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
SIGNAL U : STD_LOGIC;
SIGNAL MODE : STD_LOGIC := '1';
SIGNAL PS,NS : STATUS;

begin

delta : process (cbd, mode, ps, i) -- questo process è sensibile solo al bottone del dato, visto che se non c'è il dato è irrilevante
begin 
if( CBD = '0') then 
   NS <= PS; -- è il motivo per cui quando si preme reset e vede il bottone che passa da 1 a 0 sia ps che ns sono RST
else
if (MODE = '1') then
    case PS is
        when S0 | S4 =>
            if ( I = '0') then
                NS <= S0;
            else 
                NS <= S1;
            end if;
         when S1 =>
            if ( I = '0') then
                NS <= S2;
            else
                NS <= S1;
            end if;
         when S2 =>
            if ( I = '0') then
                NS <= S3;
            else
                NS <= S1;
            end if;
         when S3 =>
            if ( I = '0') then
                NS <= S0;
            else
                NS <= S4;
            end if;
         when others =>
            NS <= S0; -- Error
            
    end case;
  else 
     case PS is
        when S0 | S4 =>
            if ( I = '0') then
                NS <= S5;
            else
                NS <= S1;
            end if;
         when S1 =>
            if ( I = '0') then
                NS <= S2;
            else
                NS <= S6;
            end if;
         when S2 =>
            if ( I = '0') then
                NS <= S3;
            else
                NS <= S7;
            end if;
          when S3 =>
            if ( I = '0') then
                NS <= S0;
            else
                NS <= S4;
            end if;
          when S5 =>
                NS <= S6;
          when S6 =>
                NS <= S7;
         when S7=>
                NS <= S0;
         when others =>
                NS <= S0; -- Error         
    end case;
  end if;
end if;
end process;

with PS select
    U <= '1' when S4,
         '0' when others;
    
state : process (CLK)
begin
    if ( CLK = '1' and CLK'event) then
       if ( RESET = '1') then
        if(M = '1') then
            MODE <= '1';
        else MODE <= '0';
        end if;
        PS <= S0;
        Y <= '0';
       else
        PS <= NS;
        Y <= U;
        end if;
    end if;
        
end process;

end Behavioral;
