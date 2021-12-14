----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.12.2021 20:45:18
-- Design Name: 
-- Module Name: gestore_dato - Behavioral
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

entity gestore_dato is
     Port ( 
        cb : in std_logic;
        s,clk: in std_logic;
        u: out std_logic
     );
end gestore_dato;

architecture Behavioral of gestore_dato is
--    constant CLK_period:   integer := 10; 
begin
    process(clk)
    begin
        if(clk = '1' and clk'event ) then 
            if(cb = '1') then  --fronte di salita di cb
                u <= s;
            else
                u <= 'U';
            end if;
        end if;
    end process;

end Behavioral;
