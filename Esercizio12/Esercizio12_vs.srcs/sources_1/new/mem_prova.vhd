----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.01.2022 16:38:15
-- Design Name: 
-- Module Name: mem_prova - Behavioral
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

entity mem_prova is
  Port (output : out std_logic_vector(0 to 11) );
end mem_prova;

architecture Behavioral of mem_prova is
type row is array (0 to 1) of std_logic_vector(0 to 11);
type matrix is array(0 to 1) of row;
signal memoria: matrix;
constant img: matrix :=(
 0 => ("101010101010","101010101010"),
 1 => ("101010101010","101010101010")
);
begin
memoria <= img;
output <= memoria(0)(0);

end Behavioral;
