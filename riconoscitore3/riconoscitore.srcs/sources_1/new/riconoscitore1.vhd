----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2021 19:34:09
-- Design Name: 
-- Module Name: riconoscitore1 - Behavioral
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

entity riconoscitore1 is
    port(
        d,clk,a: in std_logic;
        u: out std_logic
    );
end riconoscitore1;

architecture Behavioral of riconoscitore1 is
    type state is (q0i,q00,q00d,q01,q010,q00dd,q0100);
    signal current_state : state:= q0i;
begin
    proc_next: process(clk,a)
    begin
        if(clk'event and clk = '1') then
             if( a = '1') then
                case current_state is
                    when q0i => if(d = '1') then current_state <= q01; ELSE current_state <= q00; end if; u <= '0';
                    when q00 => current_state <= q00d;
                    when q01 => if(d = '1') then current_state <= q00d; ELSE current_state <= q010; end if; u <= '0';
                    when q00d => current_state <= q00dd; u <= '0';
                    when q010 => if(d = '1') then current_state <= q00dd; ELSE current_state <= q0100; end if; u <= '0';
                    when q0100 => current_state <= q0i; u <= '0'; if(d = '1') then  u <= '1'; end if;
                    when q00dd => current_state <= q0i;  u <= '0';
                end case;   
                else
                current_state<= q0i; 
             end if;
         end if;
    end process proc_next;
            
        
end Behavioral;
