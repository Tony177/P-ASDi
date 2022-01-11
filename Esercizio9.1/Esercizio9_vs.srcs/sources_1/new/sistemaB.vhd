----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.01.2022 16:11:25
-- Design Name: 
-- Module Name: sistemaB - Behavioral
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

entity sistemaB is
    Port ( input : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC);
end sistemaB;

architecture Structural of sistemaB is
component UARTcomponent 
Generic (
		BAUD_DIVIDE_G : integer := 54;
		BAUD_RATE_G   : integer := 869
	);
port(CLK: in std_logic; 
     RXD: in std_logic; 
     DBOUT: out std_logic_vector (7 downto 0);	
     RST	: in  std_logic:= '0');

end component;
for all: UARTcomponent use entity work.UARTcomponent(Behavioral);
begin

uartB: UARTcomponent port map(CLK => clk, RST => reset, RXD => input, DBOUT => output);

end Structural;
