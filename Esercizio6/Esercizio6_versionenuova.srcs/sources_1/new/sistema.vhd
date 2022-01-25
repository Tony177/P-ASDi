----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.12.2021 13:09:37
-- Design Name: 
-- Module Name: sistema - Behavioral
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

entity sistema is
    port(
        clk : in STD_LOGIC;
        read, reset : in STD_LOGIC;
        led : out STD_LOGIC_VECTOR (0 to 2)
    );
end sistema;

architecture Behavioral of sistema is

component tester_automatico Generic( X:integer:=4);
    Port ( clk : in STD_LOGIC;
           cleared_read : in STD_LOGIC;
           delay_write : out STD_LOGIC;
           valori_tester : out STD_LOGIC_VECTOR (0 to 3));
end component;

component macchina_da_testare   
           Port ( ingresso : in STD_LOGIC_VECTOR (0 to 3);
           uscita : out STD_LOGIC_VECTOR (0 to 2));
end component;

component debouncer  Port ( button : in STD_LOGIC;
                            clk : in STD_LOGIC;
                            cleared_button : out STD_LOGIC);
end component;

component memoria Generic( N: integer);
                   Port ( input : in STD_LOGIC_VECTOR (0 to 2);
                          output : out STD_LOGIC_VECTOR (0 to 2);
                          reset, read, write : in STD_LOGIC;
                          clk : in STD_LOGIC);
end component;

component gestore_led is
    Generic( N:positive; X:positive);
    Port ( clk,reset,cleared_read : in STD_LOGIC;
           read_mem : out STD_LOGIC;
           valori_salvati : in STD_LOGIC_VECTOR (0 to 2);
           led : out STD_LOGIC_VECTOR (0 to 2));
end component;

signal valori_tester:  STD_LOGIC_VECTOR (0 to 3);
signal valori_salvati,risultati_macchina: STD_LOGIC_VECTOR (0 to 2);
signal cleared_read,read_gestore,delay_write,cleared_reset: std_logic;

begin   

    deb_read: debouncer port map(clk => clk, button => read, cleared_button => cleared_read);
    tester: tester_automatico generic map( X => 4) port map(clk => clk, cleared_read => cleared_read, valori_tester => valori_tester, delay_write=> delay_write);
    
    macchina: macchina_da_testare port map( ingresso=> valori_tester, uscita => risultati_macchina);
    
    deb_reset: debouncer port map(clk => clk, button => reset, cleared_button => cleared_reset);
    mem1: memoria generic map( N => 4) port map(clk => clk, read => read_gestore, write => delay_write, reset => cleared_reset, input => risultati_macchina, output => valori_salvati);
  
    gestore_led1: gestore_led generic map( N => 100000000, X=>4) port map(clk => clk, read_mem => read_gestore, cleared_read=> cleared_read, reset => cleared_reset, valori_salvati => valori_salvati, led => led);
    --100000000 = 1s
end Behavioral;

