----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2022 15:39:39
-- Design Name: 
-- Module Name: registro - Behavioral
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

entity registroAQ is
    generic( N: integer := 4);
    port(
        clk:in std_logic;
        reset: in std_logic;
        start: in std_logic;
        input: in std_logic_vector(N-1 downto 0); --dividendo
        input_resto_parziale: in std_logic_vector(N-1 downto 0); 
        shift: in std_logic := '0';    -- shifta a sx di 1
        en_load: in std_logic := '0';
        q_i: in std_logic := '0';   -- valore della cifra q_i
        write: in std_logic;
        output: out std_logic_vector(2*N-1 downto 0)
    );


end registroAQ;

architecture Behavioral of registroAQ is
signal temp_reg: std_logic_vector(2*N-1 downto 0) := (others => '0');
begin
proc_reg: process(clk)
    begin
        if(clk = '1' and clk'event) then
            if(reset = '1') then
                temp_reg <= (others => '0');
            elsif(start = '1') then
                temp_reg(N-1 downto 0) <= input(N-1 downto 0);    --scrivo gli N bit relativi al dividendo parziale con il dividendo iniziale
            elsif(en_load ='1') then
                temp_reg(0) <= q_i;
            elsif(shift = '1') then
                temp_reg <= temp_reg (2*N-2 downto 0) & '0';
            elsif(write = '1') then
                temp_reg(2*N-1 downto N) <= input_resto_parziale(N-1 downto 0);    --scrivo gli N bit relativi al dividendo parziale
            end if;
        end if;
    end process;
output <= temp_reg;
end Behavioral;
