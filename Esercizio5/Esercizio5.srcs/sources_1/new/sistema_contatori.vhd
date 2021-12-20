----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.12.2021 14:39:43
-- Design Name: 
-- Module Name: sistema_contatori - Behavioral
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
use IEEE.math_real."log2";
use IEEE.math_real."ceil";
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sistema_contatori is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           set : in STD_LOGIC;
           input: in std_logic_vector(1 to 17 ) := (others => '0');
           output : out STD_LOGIC_VECTOR (1 to 17));
end sistema_contatori;

architecture Structural of sistema_contatori is
component cont generic(N: positive); port (clock : in STD_LOGIC;
           reset : in STD_LOGIC; 
           ab : in STD_LOGIC; -- abilitazione da contatori precedenti (secondi -> minuti)
           set : in STD_LOGIC; -- set esterno valore iniziale
           input: in std_logic_vector ( 1 to integer( ceil( log2(real(N) ) ) ) ); -- input valore inizale da set
           output : out STD_LOGIC_VECTOR (1 to integer( ceil( log2(real(N) ) ) ) ); -- valore del conteggio 
           div : out STD_LOGIC); -- ab in uscita per prossimo contatore
end component;

component and_block port (a:in std_logic; b:in std_logic; o:out std_logic);
end component;
component wait_block port (clock: in std_logic; x:in std_logic; y:out std_logic);
end component;


constant frequency : integer := 100000000; -- 100 MHz=1s -- Per test 100Hz = 1000ns

FOR ALL: wait_block USE ENTITY work.wait_block( Behavioral);
FOR ALL: and_block USE ENTITY work.and_block(Dataflow);
FOR ALL: cont USE ENTITY work.contatore(Behavioral);


signal div_secondi,div_minuti,and_ore,div_secondi_delayed,ab_frequency : std_logic;

begin

wait_b: wait_block port map(clock=>clock,x=>div_secondi,y=>div_secondi_delayed);
and_b: and_block port map(a=>div_secondi_delayed,b=>div_minuti,o=>and_ore);
div_frequenza: cont generic map (N=>frequency) port map (clock => clock, reset => reset, set => '0', ab=>clock,input => (others => '0'), output => open,div => ab_frequency);
cont_secondi: cont generic map( N=>60 ) port map (clock => clock, reset => reset, set => set, ab=>ab_frequency, input(1 to 6)=> input(1 to 6), output(1 to 6) => output(1 to 6),div => div_secondi);
cont_minuti: cont generic map( N=>60 ) port map (clock => clock, reset => reset, set => set, ab=>div_secondi, input(1 to 6) => input(7 to 12), output(1 to 6) => output(7 to 12),div => div_minuti);
cont_ore: cont generic map( N=>24 ) port map (clock => clock, reset => reset, set => set, ab=> and_ore, input(1 to 5) => input(13 to 17), output(1 to 5) => output(13 to 17),div => open);


end Structural;
