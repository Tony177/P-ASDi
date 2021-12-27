----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2021 16:14:19
-- Design Name: 
-- Module Name: tester_automatico - Behavioral
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

entity tester_automatico is
    Generic( X:integer:=4);
    Port ( clk : in STD_LOGIC;
           read, write, reset : in STD_LOGIC;
           valori_tester : out STD_LOGIC_VECTOR (0 to 3);
           valori_salvati : out STD_LOGIC_VECTOR (0 to 2);
           risultati_macchina: in STD_LOGIC_VECTOR (0 to 2));
end tester_automatico;

                     
architecture Structural of tester_automatico is
component rom  Generic ( N: integer);
               Port ( output : out STD_LOGIC_VECTOR (0 to 3);
                      read, clk: in STD_LOGIC );
end component;
for all: rom use entity work.ROM(Behavioral); 

component debouncer  Port ( button : in STD_LOGIC;
                            clk : in STD_LOGIC;
                            cleared_button : out STD_LOGIC);
end component;
for all: debouncer use entity work.debouncer(Behavioral);

component gestore_read  Generic(N:integer);
                        Port ( cleared_read : in STD_LOGIC;
                               out_read : out STD_LOGIC;
                               clk : in STD_LOGIC);
end component;
for all: gestore_read use entity work.gestore_read(Behavioral);
 
component memoria Generic( N: integer);
                   Port ( input : in STD_LOGIC_VECTOR (0 to 2);
                          output : out STD_LOGIC_VECTOR (0 to 2);
                          reset, read, write : in STD_LOGIC;
                          clk : in STD_LOGIC);
end component;

for all: memoria use entity work.memoria(Behavioral);

component delay Port ( clk : in STD_LOGIC;
                       input : in STD_LOGIC;
                       delay_input : out STD_LOGIC);
end component;

for all: delay use entity work.delay(Behavioral);

signal cleared_read, out_read, delay_read: std_logic;
signal out_rom, out_system: std_logic_vector(0 to 3);

begin
deb_read: debouncer port map(clk => clk, button => read, cleared_button => cleared_read);

gest_read1: gestore_read generic map (N => X) port map(clk => clk, cleared_read => cleared_read, out_read => out_read);

--gest_read2: gestore_read port map(clk => clk, cleared_read => cleared_read, out_read => out_read);

rom1: rom generic map( N => X) port map( clk => clk, read => out_read, output => valori_tester);

mem1: memoria generic map( N => X) port map(clk => clk, read => delay_read, write => write, reset => reset, input => risultati_macchina, output => valori_salvati);

delay1: delay port map(clk => clk, input => out_read, delay_input => delay_read);

end Structural;
