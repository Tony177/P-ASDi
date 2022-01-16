----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.01.2022 10:11:24
-- Design Name: 
-- Module Name: ripple_curry_adder - Behavioral
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

entity ripple_curry_adder is
    Generic (N:integer:=8);
    Port ( X : in STD_LOGIC_VECTOR (N-1 downto 0);
           Y : in STD_LOGIC_VECTOR (N-1 downto 0);
           c_in : in STD_LOGIC;
           c_out : out STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (N-1 downto 0));
end ripple_curry_adder;

architecture Structural of ripple_curry_adder is
component FA Port ( a : in STD_LOGIC;
                    b : in STD_LOGIC;
                    c_in : in STD_LOGIC;
                    c_out : out STD_LOGIC;
                    s : out STD_LOGIC);
end component;
for all: FA use entity work.FA(DataFlow);

signal c: std_logic_vector(N-1 downto 1);
begin
FA_first: FA port map( a => X(0), b => Y(0), c_in => c_in, c_out => c(1), s => Z(0));
FA_last: FA port map( a => X(N-1), b => Y(N-1), c_in => c(N-1), c_out => c_out, s => Z(N-1));

middle_adder: for i in 1 to N-2 generate
                FA_middle: FA port map(a => X(i), b=> Y(i), c_in => c(i), c_out => c(i+1), s=> Z(i));
               end generate;
end Structural;
