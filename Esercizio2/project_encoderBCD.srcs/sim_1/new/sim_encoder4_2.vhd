----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.11.2021 13:07:18
-- Design Name: 
-- Module Name: sim_encoder4_2 - Behavioral
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

entity sim_encoder4_2 is
--  Port ( );
end sim_encoder4_2;

architecture Behavioral of sim_encoder4_2 is
    component encoder4_2 port( 
        x: in std_logic_vector(0 to 3);
        y: out std_logic_vector(1 downto 0)
    );
    end component;
    
    signal x:  std_logic_vector(0 to 3);
    signal y:  std_logic_vector(1 downto 0);
    
begin
    utt: entity work.encoder4_2 port map( 
        x => x,
        y => y
    );
    
    sim_proc: process
    begin   
        wait for 20ns;
        x <= "0000";
        wait for 20ns;
        x <= "0001";
        wait for 20ns;
        x <= "0010";
        wait for 20ns;
        x <= "0100";
        wait for 20ns;
        x <= "1001";
        wait;
    end process;
    
    
end Behavioral;
