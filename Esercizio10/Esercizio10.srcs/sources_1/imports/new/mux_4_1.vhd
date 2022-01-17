----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2021 15:53:32
-- Design Name: 
-- Module Name: mux_4_1 - Behavioral
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

entity mux_4_1 is
    generic( N: integer:= 4);
    Port ( a1 : STD_LOGIC_VECTOR (0 to N-1) ;
           a2 : STD_LOGIC_VECTOR (0 to N-1) ;
           a3 : STD_LOGIC_VECTOR (0 to N-1) ;
           a4 : STD_LOGIC_VECTOR (0 to N-1) ; 
           s : in STD_LOGIC_VECTOR (0 to 1);
           o : out STD_LOGIC_VECTOR(0 to N-1));
end mux_4_1;

architecture Behavioral of mux_4_1 is

begin
    o <= a1 when s = "00" else
         a2 when s = "01" else
         a3 when s = "10" else
         a4 when s = "11" else
         "----";

end Behavioral;
