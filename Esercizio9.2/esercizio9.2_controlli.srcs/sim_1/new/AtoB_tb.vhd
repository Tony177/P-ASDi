----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.01.2022 17:14:46
-- Design Name: 
-- Module Name: AtoB_tb - Behavioral
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
use work.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AtoB_tb is
--  Port ( );
end AtoB_tb;

architecture Behavioral of AtoB_tb is
component sistemaA  Generic(N:positive:=2);
                    Port ( --input : in STD_LOGIC_VECTOR (7 downto 0);
                          output : out STD_LOGIC;
                          clk : in STD_LOGIC;
                          reset : in STD_LOGIC);
                          --write: in std_logic:='0');
 end component;
 for all: sistemaA use entity work.sistemaA(Structural);
 component sistemaB Generic(N : positive);
                    Port ( input,read : in STD_LOGIC;
                           outputB : out STD_LOGIC_VECTOR (7 downto 0);
                           clk : in STD_LOGIC;
                           reset : in STD_LOGIC);
end component;
for all: sistemaB use entity work.sistemaB(Structural);
signal databus: std_logic;
signal clkA,clkB, reset, read: std_logic;
signal outputB: STD_LOGIC_VECTOR (7 downto 0);

constant CLKA_period : time := 16ns;
constant CLKB_period : time := 1ns;

begin
systemA: sistemaA port map(clk => clkA, reset => reset, output => databus);
systemB : sistemaB generic map(N => 2) port map( clk => clkB, reset => reset, input => databus, outputB => outputB, read => read);

 clkA_proc: process
    begin
        clkA <= '0';
        wait for CLKA_period/2;
        clkA <= '1';
        wait for CLKA_period/2;
    end process;
  clkB_proc: process
    begin
        clkB <= '0';
        wait for CLKB_period/2;
        clkB <= '1';
        wait for CLKB_period/2;
    end process;
sim_process: process
begin
    reset <= '1';
    wait for 20ns;
    reset <= '0';
    wait for 600ns;
    read <= '1';
    wait for 20ns;
    read <= '0';
    wait for 20ns;
    read <= '1';
    wait for 20ns;
    read <= '0';
    wait for 20ns;
    read <= '1';
    wait for 20ns;
    read <= '0';    
    wait;
end process;

end Behavioral;
