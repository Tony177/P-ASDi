----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.01.2022 15:53:24
-- Design Name: 
-- Module Name: clk_wiz_0 - Behavioral
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

entity clk_wiz_0 is
Port
 (-- Clock in ports
  CLK_IN1           : in     std_logic;
  -- Clock out ports
  CLK_OUT1          : out    std_logic
 );
end clk_wiz_0;

architecture Behavioral of clk_wiz_0 is
signal temp_clk_out: std_logic;
begin
process(CLK_IN1)
variable count: integer:=0;
    begin
        if(CLK_IN1='1' and CLK_IN1'event) then
            temp_clk_out <= '0';
            count:= count+1;
            if(count = 4) then
               temp_clk_out <= '1';
               count :=0;
            end if; 
        end if;
    end process;

CLK_OUT1 <= temp_clk_out;
end Behavioral;
