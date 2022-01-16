----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.01.2022 10:09:39
-- Design Name: 
-- Module Name: adder_subtracter - Behavioral
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

entity adder_subtracter is
    Generic(N:integer:=8);
    Port ( X : in STD_LOGIC_VECTOR (N-1 downto 0);
           Y : in STD_LOGIC_VECTOR (N-1 downto 0);
           c_in : in STD_LOGIC;
           c_out : out STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (N-1 downto 0));
end adder_subtracter;

architecture Structural of adder_subtracter is
component ripple_curry_adder Generic (N:integer:=8);
                             Port ( X,Y : in STD_LOGIC_VECTOR (N-1 downto 0);
                                    c_in : in STD_LOGIC;
                                    c_out : out STD_LOGIC;
                                    Z : out STD_LOGIC_VECTOR (N-1 downto 0));
end component;
for all: ripple_curry_adder use entity work.ripple_curry_adder(Structural);

signal complementoy: std_logic_vector(N-1 downto 0);
begin
complemento: for i in 0 to N-1 generate
                complementoy(i) <= Y(i) xor c_in;
             end generate;
RA: ripple_curry_adder generic map( N => N) port map( X => X, Y => complementoy, c_in => c_in, c_out => c_out, Z => Z);

end Structural;
