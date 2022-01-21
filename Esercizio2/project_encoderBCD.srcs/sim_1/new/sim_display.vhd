----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2021 16:53:04
-- Design Name: 
-- Module Name: sim_display - Behavioral
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

entity sim_display is
--  Port ( );
end sim_display;

architecture Behavioral of sim_display is
    component display_manager is
       Port ( 
            --clk: in std_logic;
            --rst: in std_logic;
            value: in std_logic_vector(3 downto 0);
            anode : out std_logic; --illumino fisso la prima cifra del display
            cathode : out std_logic_vector(7 downto 0)
       );
    end component;
    signal v :  std_logic_vector(3 downto 0);
    signal a :  std_logic := '1'; --illumino fisso la prima cifra del display
    signal c :  std_logic_vector(7 downto 0);
begin
    utt: entity work.display_manager port map(
        value => v,
        anode => a,
        cathode => c
    );
    sim_proc: process
        begin
            wait for 20 ns;
            v <= "0100";
            wait for 20 ns;
            v <= "0110";
            wait for 20 ns;
            v <= "1001";
            wait for 20 ns;
            v <= "0111";
            wait for 20 ns;
            wait;
        end process;
end Behavioral;
