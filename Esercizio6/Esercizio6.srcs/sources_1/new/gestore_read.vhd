----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2021 13:19:36
-- Design Name: 
-- Module Name: gestore_read - Behavioral
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

entity gestore_read is
    Generic (N: integer);
    Port ( cleared_read : in STD_LOGIC;
           out_read : out STD_LOGIC;
           clk : in STD_LOGIC);
end gestore_read;

architecture Behavioral of gestore_read is
type status is(READ, NOTREAD);
begin
gest_read: process(clk)
    variable stato: status :=NOTREAD;
    variable count: integer:=0;
    begin
    if(clk='1' and clk'event) then
            if count=N then 
                stato := NOTREAD;
                count:=0;
            end if;
            if(stato = NOTREAD) then
                out_read <= '0';
            else 
                count:= count+1;
                out_read <= '1';
            end if;
            if(cleared_read = '1') then
                if(stato = NOTREAD) then
                    stato := READ;
                else 
                    stato := NOTREAD;
                end if;
                
            end if;
    end if;
    
end process;


end Behavioral;
