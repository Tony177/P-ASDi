----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2022 16:03:14
-- Design Name: 
-- Module Name: adder - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder is
    Generic ( M : integer:= 4);
    Port ( 
           clk : in STD_LOGIC;
           reset : in STD_LOGIC; 
           enable : in std_logic;
           carry_in: in std_logic :='0';
           input1 : in STD_LOGIC_VECTOR (M-1 downto 0); 
           input2 : in STD_LOGIC_VECTOR (M-1 downto 0);
           output : out STD_LOGIC_VECTOR (M-1 downto 0);
           s : out std_logic
          );
end adder;

architecture Behavioral of adder is
signal temp_out: STD_LOGIC_VECTOR (M-1 downto 0) := (others => '0');
signal a,b,sum_temp: unsigned(M-1 downto 0);
signal c: unsigned;
begin
    process(clk)
    begin
        if(clk = '1' and clk'event) then
            if(reset = '1') then
                temp_out <= (others => '0');
                sum_temp <= (others => '0');
            elsif(enable = '1') then
                a <= unsigned(input1(M-1 downto 0));
                b <= unsigned(input2(M-1 downto 0));
                if(carry_in = '1') then 
                    sum_temp <= a+b+1;
                else
                    sum_temp <= a+b;
                end if;
            
            end if;
        end if;
    end process;
output <= std_logic_vector(sum_temp);
end Behavioral;
