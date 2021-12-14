----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.12.2021 20:45:37
-- Design Name: 
-- Module Name: gestore_modo - Behavioral
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

entity gestore_modo is
     Port ( 
        cb,s,clk: in std_logic;
        u: out std_logic
     );
end gestore_modo;

architecture Behavioral of gestore_modo is


    


--    constant CLK_period:   integer := 10;
signal tmp: std_logic := '0';
begin
    process(clk)
    begin
        if (CLK'event and CLK = '1') then
            if((cb = '1')) then  --fronte di discesa di cb
                tmp <= s;
            end if;
        end if;
    end process;
    u <= tmp;
end Behavioral;
