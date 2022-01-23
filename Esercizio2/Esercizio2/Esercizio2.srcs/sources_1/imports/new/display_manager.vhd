----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2021 16:31:02
-- Design Name: 
-- Module Name: display_manager - Behavioral
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

entity display_manager is
       Port ( 
            --clk: in std_logic;
            --rst: in std_logic;
            value: in std_logic_vector(3 downto 0);
            anode : out std_logic_vector(7 downto 0); --illumino fisso la prima cifra del display
            cathode : out std_logic_vector(7 downto 0)
       );
end display_manager;

architecture behavioral of display_manager is

constant zero   : std_logic_vector(6 downto 0) := "1000000"; 
constant one    : std_logic_vector(6 downto 0) := "1111001"; 
constant two    : std_logic_vector(6 downto 0) := "0100100"; 
constant three  : std_logic_vector(6 downto 0) := "0110000"; 
constant four   : std_logic_vector(6 downto 0) := "0011001"; 
constant five   : std_logic_vector(6 downto 0) := "0010010"; 
constant six    : std_logic_vector(6 downto 0) := "0000010"; 
constant seven  : std_logic_vector(6 downto 0) := "1111000"; 
constant eight  : std_logic_vector(6 downto 0) := "0000000"; 
constant nine   : std_logic_vector(6 downto 0) := "0010000"; 
constant a   	: std_logic_vector(6 downto 0) := "0001000"; 
constant b      : std_logic_vector(6 downto 0) := "0000011"; 
constant c      : std_logic_vector(6 downto 0) := "1000110"; 
constant d      : std_logic_vector(6 downto 0) := "0100001"; 
constant e      : std_logic_vector(6 downto 0) := "0000110"; 
constant f      : std_logic_vector(6 downto 0) := "0001110";

begin
    anode <= not("00000001");
    with value select  
             cathode <= '1' & zero  when "0000",
                        '1' & one   when "0001",
                        '1' & two   when "0010",
                        '1' & three when "0011",
                        '1' & four  when "0100",
                        '1' & five  when "0101",
                        '1' & six   when "0110",
                        '1' & seven when "0111",
                        '1' & eight when "1000",
                        '1' & nine  when "1001",
                        "--------" when others;

end behavioral;
