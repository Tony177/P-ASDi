----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2021 17:02:00
-- Design Name: 
-- Module Name: sistema_completo - Behavioral
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

entity sistema_completo is
    Port ( 
        x: in std_logic_vector(10-1 downto 0);
        anode : out  std_logic_vector(7 downto 0); --illumino fisso la prima cifra del display
        cathode : out std_logic_vector(7 downto 0)
    );
end sistema_completo;

architecture structural of sistema_completo is
    component encoder is
    Port ( 
        x: in std_logic_vector(10-1 downto 0);
        y: out std_logic_vector(4-1 downto 0)
    );
    end component;
    
    component display_manager is Port ( 
            --clk: in std_logic;
            --rst: in std_logic;
            value: in std_logic_vector(3 downto 0);
            anode : out std_logic_vector(7 downto 0); --illumino fisso la prima cifra del display
            cathode : out std_logic_vector(7 downto 0)
       );
    end component;
    signal tmp : std_logic_vector(3 downto 0) := "----";
begin
    enc:  encoder Port map ( 
        x => x,
        y => tmp
    );
    disp:  display_manager Port map ( 
        value => tmp,
        anode => anode,
        cathode => cathode
    );

end structural;
