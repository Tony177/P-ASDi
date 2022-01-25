----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.01.2022 10:47:17
-- Design Name: 
-- Module Name: shift_register_bidirezionale_tb - Behavioral
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

entity shift_register_bidirezionale_tb is
--  Port ( );
end shift_register_bidirezionale_tb;

architecture Behavioral of shift_register_bidirezionale_tb is

component sr Generic( N: positive :=7);
            Port ( input : in STD_LOGIC;
                   output : inout STD_LOGIC_VECTOR (1 to N);
                   clk : in STD_LOGIC;
                   mode,a : in bit;
                   reset : in STD_LOGIC;
                   shift: in bit :='0');
end component;

for all: sr use entity work.shift_register_bidirezionale(Structural);

signal input, clk, reset : std_logic;
signal mode,a,shift: bit;
signal output: std_logic_vector(1 to 7);

constant CLK_period : time := 10 ns;

begin

sr1: sr PORT MAP(a =>a, input => input, output => output, reset => reset, clk => clk,mode => mode, shift => shift);

clock : process
  begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;

ingressi : process
    begin
        input <= '0';
        a<= '1';
        reset<='1';
		wait for 15 ns;
		reset<='0';
		wait for 15 ns;
		input<='1';
		wait for 15 ns;
		input<='0';
		wait for 15 ns;
		input<='0';
		wait for 15 ns;
		input<='1';
		wait for 15 ns;
		input<='0';
		wait for 15 ns;
		input<='1';
		wait for 15 ns;
		input<='1';
		wait for 15 ns;
		input<='0';
		wait for 15 ns;
		input<='0';
		wait for 15 ns;
		mode<='1';
		wait for 15 ns;
		input<='0';
		wait for 15 ns;
		input<='0';
		wait for 15 ns;
		input<='1';
		wait for 15 ns;
		input<='0';
		wait for 15 ns;
		input<='0';
		wait for 15 ns;
		input<='1';
		wait for 15 ns;
		mode <= '0';
    end process;
--abilitazione: process
--begin
--		a <= '0';
--		wait for 3*CLK_period;
--		a <= '1';
--		wait for 3*CLK_period;
--end process;

direzione_shift: process
begin
		shift <= '0';
		wait for 6*CLK_period;
		shift <= '1';
		wait for 6*CLK_period;
end process;
 

end Behavioral;
