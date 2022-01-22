----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.01.2022 16:33:46
-- Design Name: 
-- Module Name: systemA_tb - Behavioral
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

entity systemA_tb is
--  Port ( );
end systemA_tb;

architecture Behavioral of systemA_tb is
component sistemaA Generic(N:positive:=2);
                   Port ( output : out STD_LOGIC;
                          clk : in STD_LOGIC;
                          reset : in STD_LOGIC);
end component;

for all: sistemaA use entity work.sistemaA(Structural);

constant CLKA_period : time := 10ns;
signal clkA, reset, databus:std_logic;
begin
systemA: sistemaA port map(clk => clkA, reset => reset, output => databus);

clkA_proc: process
    begin
        clkA <= '0';
        wait for CLKA_period/2;
        clkA <= '1';
        wait for CLKA_period/2;
    end process;
    
    
sim_process: process
begin
    reset <= '1';
    wait for 10ns;
    reset <= '0';
    wait;
end process;

end Behavioral;
