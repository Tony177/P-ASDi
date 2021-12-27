----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2021 17:18:25
-- Design Name: 
-- Module Name: tester_tb - Behavioral
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

entity tester_tb is
--  Port ( );
end tester_tb;

architecture Structural of tester_tb is

component tester_automatico  Generic( X:integer);
                             Port ( clk : in STD_LOGIC;
                                    read, write, reset : in STD_LOGIC;
                                    valori_tester : out STD_LOGIC_VECTOR (0 to 3);
                                    valori_salvati : out STD_LOGIC_VECTOR (0 to 2);
                                    risultati_macchina: in STD_LOGIC_VECTOR (0 to 2));
end component;

for all: tester_automatico use entity work.tester_automatico(Structural);

component macchina_da_testare Port ( ingresso : in STD_LOGIC_VECTOR (0 to 3);
                                     uscita : out STD_LOGIC_VECTOR (0 to 2));
end component;

for all: macchina_da_testare use entity work.macchina_da_testare(Behavioral);

signal read, write, clk, reset: std_logic;
signal valori_tester : STD_LOGIC_VECTOR (0 to 3);
signal valori_salvati :  STD_LOGIC_VECTOR (0 to 2);
signal risultati_macchina:  STD_LOGIC_VECTOR (0 to 2);

constant CLK_period : time := 10 ns;
begin

tester: tester_automatico generic map( X => 4) 
                          port map( clk => clk, read => read, write => write, reset => reset, valori_tester => valori_tester, valori_salvati => valori_salvati, risultati_macchina => risultati_macchina);

m: macchina_da_testare port map(ingresso => valori_tester, uscita => risultati_macchina);

clock : process
  begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 testing: process
    begin
    reset <= '1';
    wait for 10ns;
    reset <= '0';
    wait for 10ns;
    read <= '1';
    wait for 15ns;
    read <= '0';
    wait for 120ns;
    --read <= '1';
    --wait for 15ns;
    --read <= '0';
    --wait for 100ns;
    write <= '1';
    wait for 10ns;
    write <= '0';
    wait for 10ns;
    write <= '1';
    wait for 10ns;
    write <= '0';
    wait for 10ns;
    write <= '1';
    wait for 10ns;
    write <= '0';
    wait for 10ns;
    write <= '1';
    wait for 10ns;
    write <= '0';
    wait for 10ns;
    write <= '1';
    wait for 10ns;
    write <= '0';
    wait for 10ns;
    write <= '1';
    wait for 10ns;
    write <= '0';
    wait for 10ns;
    write <= '1';
    wait for 10ns;
    write <= '0';
    wait for 10ns;
    write <= '1';
    wait for 10ns;
    write <= '0';
    wait for 10ns;
    write <= '1';
    wait for 10ns;
    write <= '0';
    wait for 10ns;
    write <= '1';
    wait for 10ns;
    write <= '0';
    wait for 10ns;
    write <= '1';
    wait for 10ns;
    write <= '0';
    wait for 10ns;
    write <= '1';
    wait for 10ns;
    write <= '0';
    wait for 10ns;
    write <= '1';
    wait for 10ns;
    write <= '0';
    wait for 10ns;
    write <= '1';
    wait for 10ns;
    write <= '0';
    wait for 10ns;
    write <= '1';
    wait for 10ns;
    write <= '0';
    wait for 10ns;
    write <= '1';
    wait for 10ns;
    write <= '0';
    wait for 10ns;
    wait;
    end process;

end Structural;
