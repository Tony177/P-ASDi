----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.01.2022 16:41:32
-- Design Name: 
-- Module Name: rete_16_4_tb - Behavioral
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

entity rete_16_4_tb is
end rete_16_4_tb;

architecture Behavioral of rete_16_4_tb is
component rete_16_4     Port ( ingresso : in STD_LOGIC_VECTOR (0 to 15);
           uscita : out STD_LOGIC_VECTOR (0 to 3);
           sel_mux : in STD_LOGIC_VECTOR (0 to 3);
           sel_demux : in STD_LOGIC_VECTOR (0 to 1));
end component;
FOR ALL: rete_16_4 use entity  work.rete_16_4 (Structural);

signal i: std_logic_vector(0 to 15);
signal u: std_logic_vector(0 to 3);
signal s_mux: std_logic_vector(0 to 3);
signal s_demux: std_logic_vector(0 to 1);


begin
rete_16_4_1: rete_16_4 port map(ingresso (0 to 15) => i(0 to 15), uscita (0 to 3) => u (0 to 3), sel_mux(0 to 3) => s_mux(0 to 3), sel_demux(0 to 1) => s_demux(0 to 1));

rete_16_4_2: i <= "0000001000000000",
"0000000000000000" after 100ns,
"1000000000000000" after 200ns,
"1110111111111111" after 300ns;

rete_16_4_3: s_mux <= "1001",
"1111" after 100ns,
"0000" after 200ns,
"1100" after 300ns;

rete_16_4_4: s_demux <= "00",
"10" after 100ns;


end Behavioral;
