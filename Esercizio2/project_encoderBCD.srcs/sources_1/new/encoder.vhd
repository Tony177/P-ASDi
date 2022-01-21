----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.11.2021 12:04:21
-- Design Name: 
-- Module Name: encoder - Behavioral
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

entity encoder is
    Port ( 
        x: in std_logic_vector(10-1 downto 0);
        y: out std_logic_vector(4-1 downto 0)
    );
end encoder;



architecture structural of encoder is
    component arbitro port(
        x: in std_logic_vector(10-1 downto 0);
        y: out std_logic_vector(10-1 downto 0)
    );
    end component;
    
    component encoder10_4 port ( 
         x: in std_logic_vector(10-1 downto 0);
         y: out std_logic_vector(4-1 downto 0)
    );
    end component;
    
    signal t: std_logic_vector(10-1 downto 0);
begin
   arbitro_1: arbitro port map(
        x => x,
        y => t
   );
   encoder10_4_1:  encoder10_4 port map(
        x => t,
        y => y
   );
end structural;
