----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.01.2022 11:04:59
-- Design Name: 
-- Module Name: adder_tb - Behavioral
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

entity adder_tb is
--  Port ( );
end adder_tb;

architecture Behavioral of adder_tb is
component adder_subtracter  Generic(N:integer:=4);
                            Port ( X : in STD_LOGIC_VECTOR (N-1 downto 0);
                                   Y : in STD_LOGIC_VECTOR (N-1 downto 0);
                                   c_in : in STD_LOGIC;
                                   c_out : out STD_LOGIC;
                                   Z : out STD_LOGIC_VECTOR (N-1 downto 0));
end component;
for all: adder_subtracter use entity work.adder_subtracter(Structural);
 
signal X,Y,Z: STD_LOGIC_VECTOR (3 downto 0);
signal cin,cout:std_logic; 

begin

adder: adder_subtracter generic map(N => 4) port map(X => X, Y => Y, c_in => cin, c_out => cout, Z => Z);

process
 begin
    X <= "0001";
    Y <= "0100";
    cin <= '1';
    wait;
 end process;
end Behavioral;
