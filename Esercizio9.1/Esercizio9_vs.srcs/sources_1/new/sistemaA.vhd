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

entity sistemaA is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           write: in std_logic);
end sistemaA;

architecture Structural of sistemaA is
component UARTcomponent
Generic (
		BAUD_DIVIDE_G : integer := 54;
		BAUD_RATE_G   : integer := 869 
	);
port(CLK: in std_logic; 
     TXD: out std_logic  := '1'; 
     DBIN: in std_logic_vector (7 downto 0);	
     WR: in std_logic;
     RST	: in  std_logic:= '0'
     );
end component;
for all: UARTcomponent use entity work.UARTcomponent(Behavioral);

begin
uartA: UARTcomponent port map(CLK => clk, RST => reset, DBIN => input, WR => write, TXD => output);

end Structural;
