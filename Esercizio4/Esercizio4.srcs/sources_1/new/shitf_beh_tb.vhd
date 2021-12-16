----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2021 15:37:22
-- Design Name: 
-- Module Name: shitf_beh_tb - Behavioral
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

entity shitf_beh_tb is
--  Port ( );
end shitf_beh_tb;

architecture Behavioral of shitf_beh_tb is
component sr 
generic( X:integer := 8);
port (clock : in std_logic;
           direction : in bit:= '0'; --0 sinistra, 1 destra
           reset : in std_logic;
           input : in std_logic;
           u : out std_logic_vector(0 to X);
           ab: in bit;
           Y : in integer);
           
end component;

FOR ALL: sr USE ENTITY work.shift_beh (Behavioral);
signal clock,reset,input : std_logic := '0';
signal direction : bit;
signal u: std_logic_vector(0 to 8);
signal ab: bit;
signal Y: integer:=0;

constant CLK_period : time := 30 ns;


begin
sr1: sr generic map (X => 8) port map (clock=>clock, reset=>reset, input=>input, direction=>direction, u=>u ,ab=>ab, Y=>Y);
     
    

clk: process
    begin
        clock <= '0';
        wait for CLK_period/2;
        clock <= '1';
        wait for CLK_period/2;
    end process;    

sr2: process
    begin
        reset <='1';
        direction <= '1';
        wait for CLK_period;
        reset <='0';
        wait for CLK_period;
        input <='1';
        ab <='1';
        Y <= 4;
        wait for CLK_period*4;
        ab <= '0';
        Y<=10;
        input <= '0';
        wait for CLK_period*3;
        Y<=2;
        ab <= '1';
        wait for CLK_period*2;
        input <='1';
        wait;
        
    end process;

end Behavioral;
