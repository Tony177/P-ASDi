----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2021 21:41:21
-- Design Name: 
-- Module Name: riconoscitore2 - Behavioral
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

entity riconoscitore2 is
    port(
        d,clk,a: in std_logic;
        u: out std_logic
    );
end riconoscitore2;

architecture Behavioral of riconoscitore2 is
    type state is (q1i,q11,q110,q1100);
    signal current_state : state:= q1i;
begin
    proc_next: process(clk,a) 
    begin
         if(clk'event and clk = '1') then
            if(a = '1') then
                case current_state is
                    when q1i => if(d = '1') then current_state <= q11; ELSE current_state <= q1i; end if; u <= '0';
                    when q11 => if(d = '1') then current_state <= q11; ELSE current_state <= q110; end if; u <= '0';
                    when q110 => if(d = '1') then current_state <= q11; ELSE current_state <= q1100; end if; u <= '0';
                    when q1100 => if(d = '1') then  u <= '1'; ELSE u <= '0'; end if; current_state <= q1i; 
                end case;
                else 
                    current_state <= q1i;    
             end if;
         end if;
         
    end process proc_next;
            
        
end Behavioral;