----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2021 16:37:29
-- Design Name: 
-- Module Name: riconoscitore - Behavioral
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

entity riconoscitore is
    Port ( b1,b2,s1,s2,clk,reset : in STD_LOGIC;
           u : out STD_LOGIC);
end riconoscitore;

architecture Structural of riconoscitore is

component sistem PORT(clk : in STD_LOGIC;
                      reset : in STD_LOGIC := '0';
                      i,CBD : in STD_LOGIC;
                      m : in STD_LOGIC := '1';
                      y : out STD_LOGIC);
end component;

for all: sistem use entity work.sistema(Behavioral);
-- il gestore del modo mi serve lo stesso poiché il valore del modo deve rimanere costante e non viene preso se non c'è il reset
component gmodo PORT(b2 : in STD_LOGIC;
                     s2 : in STD_LOGIC;
                     clk : in STD_LOGIC;
                     modo : out STD_LOGIC);
end component;

for all: gmodo use entity work.gestore_modo(Structural);

-- rimuovo il gestore dato poiché gestisco tutto nell'entità prendendo il dato solo quando c'è il bottone
-- lascio il debouncer per pulire il bottone del dato
component deb PORT(button : in STD_LOGIC;
                     clk : in STD_LOGIC;
                     cleared_button : out STD_LOGIC);
end component;

for all: deb  use entity work.debouncer(Behavioral);

signal CBD : std_logic;
signal modo: std_logic;

begin

sistem1: sistem PORT MAP ( clk => clk, i => s1, m => modo, reset=> reset, CBD => CBD, y => u);

deb1: deb PORT MAP( clk => clk, button => b1, cleared_button => CBD);

gmodo1: gmodo PORT MAP( clk => clk, b2 => b2, s2 => s2, modo => modo);

end Structural;
