----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.12.2021 15:52:24
-- Design Name: 
-- Module Name: gestore_led - Behavioral
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

entity gestore_led is
    Generic( N:positive; X:positive);
    Port ( clk,reset,cleared_read : in STD_LOGIC;
           read_mem : out STD_LOGIC;
           valori_salvati : in STD_LOGIC_VECTOR (0 to 2);
           led : out STD_LOGIC_VECTOR (0 to 2));
end gestore_led;

architecture Behavioral of gestore_led is
type state is(q0,q_ready,q_ready2);
signal stato: state := q0;
signal temp: STD_LOGIC_VECTOR (0 to 2);
begin
    process(clk)
    variable count: integer := 0;
    variable count_valori: integer := 0;
    begin 
         if( clk = '1' and clk'event) then
                if(reset = '1') then
                    count := 0;
                    count_valori := 0;
                    led <= (others => '0');
                    stato <= q0;
                end if;
                case stato is
                    when q0 =>  count := 0;
                                count_valori := 0;
                                if(cleared_read = '1') then
                                    stato <= q_ready;
                                else
                                    stato <= q0;
                                end if;
                     when q_ready =>    if(count_valori /= 0) then
                                            read_mem <= '1';
                                        end if;
                                        count_valori := count_valori + 1 mod X;  
                                        stato <= q_ready2;
                      when q_ready2 =>  read_mem <= '0';
                                        led <= valori_salvati;
                                        if(count < N-1) then 
                                            count := count + 1 mod N; 
                                            stato <= q_ready2;
                                        elsif(count_valori < X+1) then
                                                count := 0;
                                               stato <= q_ready;
                                        else
                                           stato <= q0;
                                        end if;           
                end case;
         end if;
    end process;
    
end Behavioral;
