----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.12.2021 14:25:51
-- Design Name: 
-- Module Name: contatore_tb - Behavioral
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

entity contatore_tb is
--  Port ( );
end contatore_tb;

architecture Behavioral of contatore_tb is
component contatore_tb 
Generic (N: positive:=3);
Port(clock : in STD_LOGIC;
           reset : in STD_LOGIC; 
           ab : in STD_LOGIC; -- abilitazione da contatori precedenti (secondi -> minuti)
           set : in STD_LOGIC; -- set esterno valore iniziale
           input: in std_logic_vector ( 1 to N); -- input valore inizale da set
           output : out STD_LOGIC_VECTOR (1 to N); -- valore del conteggio 
           div : out STD_LOGIC); -- ab in uscita per prossimo contatore
end component;

constant CLK_period :time := 10ns;
FOR ALL: contatore_tb USE ENTITY work.contatore (Behavioral);
signal clock,reset,set,div : std_logic;
signal ab: STD_LOGIC;
signal input,output: std_logic_vector(1 to 3);
begin

pm : contatore_tb port map(clock => clock, reset => reset, set => set, div => div, ab => ab, input => input, output => output);

clk: process
begin
    clock <= '0';
    wait for CLK_period/2;
    clock <= '1';
    wait for CLK_period/2;
end process;

cont1: process
begin
    reset <= '1';
    wait for 10ns;
    reset <= '0';
    wait for 10ns;
    ab <= '1';
    wait for 10ns;
    
end process;
       

end Behavioral;
