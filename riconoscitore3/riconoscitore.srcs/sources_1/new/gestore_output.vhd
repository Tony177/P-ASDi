----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.12.2021 16:24:39
-- Design Name: 
-- Module Name: gestore_output - Behavioral
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

entity gestore_output is
    port(
        out1,out2: in std_logic;
        ab: in std_logic_vector(0 to 1);
        u: out std_logic
    );
end gestore_output;

architecture Behavioral of gestore_output is
    
begin
   
        u <= out1 when ab = "10" else 
             out2 when ab = "01" else
            '0';
       
    

end Behavioral;
