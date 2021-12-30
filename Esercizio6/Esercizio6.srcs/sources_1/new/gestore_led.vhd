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
type state is(READY, NOTREADY);
signal stato: state := NOTREADY;
signal temp: STD_LOGIC_VECTOR (0 to 2);
begin
    process(clk)
    variable count: integer := 0;
    begin 
         if( clk = '1' and clk'event) then
            if(cleared_read = '1') then
                stato <= READY;
            end if;
            if(reset = '1') then
                read_mem <= '0';
                stato <= NOTREADY;
                temp <= (others =>  '0');
                count := 0;
            elsif( count = N-1 and stato = READY) then      
                    read_mem <= '1';
                    count := 0; 
            elsif( stato = READY) then  
                temp <= valori_salvati;
                count := count + 1 mod N;  
                read_mem <= '0';
            end if;          --aspetto 1s count_valori = 0,
                                    --count_valori = 1 2s 4,
                                    --count_valori = 2 3s 7,
                                    --count_valori = 3 4s 1,
                                    --count_valori = 4 5s 6,
                                    --count_valori = 1 2s 4,   
         end if;
    end process;
    
    
    led <= temp; 
end Behavioral;
