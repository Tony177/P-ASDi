----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.01.2022 10:55:09
-- Design Name: 
-- Module Name: test - Behavioral
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

entity test is
--  Port ( );
end test;

architecture Behavioral of test is
component top is
    Port ( CLK_I : in  STD_LOGIC;
           VGA_HS_O : out  STD_LOGIC;
           VGA_VS_O : out  STD_LOGIC;
           VGA_R : out  STD_LOGIC_VECTOR (3 downto 0);
           VGA_B : out  STD_LOGIC_VECTOR (3 downto 0);
           VGA_G : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

signal clk: std_logic;
signal VGA_HS_O :  STD_LOGIC;
signal VGA_VS_O :  STD_LOGIC;
signal VGA_R :  STD_LOGIC_VECTOR (3 downto 0);
signal VGA_B :  STD_LOGIC_VECTOR (3 downto 0);
signal VGA_G :  STD_LOGIC_VECTOR (3 downto 0);

begin
    utt: top port map(
       CLK_I =>  clk,
        VGA_HS_O  => VGA_HS_O,
        VGA_VS_O  => VGA_VS_O,
 VGA_R => VGA_R,
 VGA_B => VGA_B,
 VGA_G => VGA_G);

    process
    begin
    clk <= '1';
    wait for 0.1ns;
    clk <= '0';
    wait for 0.1ns;
    end process;

end Behavioral;
