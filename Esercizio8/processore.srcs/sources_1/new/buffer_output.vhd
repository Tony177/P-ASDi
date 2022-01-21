----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.01.2022 16:41:25
-- Design Name: 
-- Module Name: buffer_output - Behavioral
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
use work.common_defs.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity buffer_output is
     Port ( mem_instr_in : in mbr_data_type;
            mem_data_out : in reg_data_type;
           clock : in STD_LOGIC;
           reset: in STD_LOGIC;
           data_out : out std_logic_vector(7 downto 0):= (others => '0'));
end buffer_output;

architecture Behavioral of buffer_output is
signal temp:  std_logic_vector(7 downto 0):= (others => '0');
begin
    process(clock)
    begin
        if(clock = '1' and clock'event) then
            if(mem_instr_in = X"36") then
                temp <= mem_data_out(7 downto 0);
             end if;
             if(reset = '1') then
                temp <= (0 => '1',others => '0');
             end if;
        end if;
    end process;
data_out <= temp;
end Behavioral;
