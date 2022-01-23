----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.11.2021 17:27:47
-- Design Name: 
-- Module Name: sim_encoderfinale - Behavioral
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

entity sim_encoderfinale is
--  Port ( );
end sim_encoderfinale;

architecture Behavioral of sim_encoderfinale is

    component encoder is
    Port ( 
        x: in std_logic_vector(9 downto 0);
        y: out std_logic_vector(3 downto 0)
    );
    end component;
    
    signal x:  std_logic_vector(9 downto 0);
    signal y:  std_logic_vector(3 downto 0);
    
begin
    utt: entity work.encoder port map(
        x => x,
        y => y
    );
    sim_proc: process
    begin
        wait for 20ns;
        x <= (0 => '1', others => '0');
        wait for 40ns;
        x <= (0 => '1', 1 => '1', others => '0');
        wait for 40ns;
        x <= (7 => '1', others => '0');
        wait for 20ns;
        x <= (9 => '1', others => '0');
        wait for 20ns;
        x <= (others => '0');
        wait;
    end process;
    
end Behavioral;
