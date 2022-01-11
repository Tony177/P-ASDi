----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.01.2022 16:11:25
-- Design Name: 
-- Module Name: sistemaA - Behavioral
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

entity sistema_complessivo is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           write: in std_logic);
end sistema_complessivo;

architecture Structural of sistema_complessivo is
component sistemaA is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           write: in std_logic);
end component;

component sistemaB is
    Port ( input : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC);
end component;

component debouncer is
    Port ( button : in STD_LOGIC;
           clock : in STD_LOGIC;
           cleared_button : out STD_LOGIC);
end component;



signal reset_cleared, write_cleared,data: std_logic;
begin
sisA: sistemaA port map(input => input, output => data, clk => clk, reset => reset_cleared, write => write_cleared);



sisB: sistemaB port map(input => data, output => output, clk => clk, reset => reset_cleared);

debouncer1: debouncer port map (button => reset, clock => clk, cleared_button => reset_cleared);
debouncer2: debouncer port map (button => write, clock => clk, cleared_button => write_cleared);

end Structural;
