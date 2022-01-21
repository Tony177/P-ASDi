----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 08.12.2021 15:52:58
-- Design Name:
-- Module Name: mux_16_1_tb - structural
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



entity mux_16_1_tb is
end mux_16_1_tb;



architecture structural of mux_16_1_tb is
component mux_16 port(a1 : in STD_LOGIC_VECTOR (0 to 15);
s1 : in STD_LOGIC_VECTOR (0 to 3);
o1 : out STD_LOGIC);
end component;

FOR ALL: mux_16 USE ENTITY WORK.mux_16_1 (Structural);

SIGNAL input : STD_LOGIC_VECTOR (0 TO 15);
SIGNAL selection : STD_LOGIC_VECTOR (0 TO 3);
SIGNAL output : STD_LOGIC;

begin
mux_16_1 : mux_16 PORT MAP (a1(0 to 15)=>input(0 to 15), s1(0to 3)=>selection(0 to 3), o1=>output);

mux_16_2 : input <= "0000000000000000",
"0000000000000001" AFTER 100 NS,
"0000000000000011" AFTER 200 NS,
"1100000000000000" AFTER 300 NS;

mux_16_3 : selection <= "0000",
"1111" AFTER 100 NS,
"0011" AFTER 200 NS,
"1100" AFTER 300 NS;
end structural;