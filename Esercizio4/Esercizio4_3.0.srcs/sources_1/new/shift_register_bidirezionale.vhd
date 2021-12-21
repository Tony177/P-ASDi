----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2021 17:41:17
-- Design Name: 
-- Module Name: shift_register_bidirezionale - Behavioral
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

entity shift_register_bidirezionale is
    Generic( N: positive :=6; Y:positive :=2);
    Port ( input : in STD_LOGIC;
           output : inout STD_LOGIC_VECTOR (1 to N);
           clk : in STD_LOGIC;
           mode,a : in bit;--0 sinsitra, 1 destra;
           reset : in STD_LOGIC);
end shift_register_bidirezionale;

architecture Structural of shift_register_bidirezionale is

component ffd_bidirezionale PORT (leftInput, rightInput, clk, reset : in STD_LOGIC;
                    mode,a: in bit;
                    output : out STD_LOGIC);
end component;
for all: ffd_bidirezionale use entity work.ffd_bidirezionale(Behavioral);

--signal Uscite: std_logic_vector(1 to N);

begin
flipflop : for i in 1 to N generate

            primoff:if i = 1 generate
            ff: ffd_bidirezionale PORT MAP(a => a, leftInput => input, clk => clk, reset => reset,mode => mode,output => output(i), rightInput => output(i+Y));
            end generate primoff;
            
            ffvuoti1: if i /= 1 and i < Y+1 generate
            ff: ffd_bidirezionale PORT MAP(a => a, leftInput => '0', clk => clk, reset => reset,mode => mode,output => output(i), rightInput => output(i+Y));
            end generate ffvuoti1;
            
            ultimoff:if i = N generate
            ff: ffd_bidirezionale PORT MAP(a => a, leftInput => output(i-Y) , clk => clk, reset => reset,mode => mode,output => output(i), rightInput => input);
            end generate ultimoff;
            
            ffvuoti2: if i /= N and i > N-Y generate
            ff: ffd_bidirezionale PORT MAP(a => a, leftInput => output(i-Y), clk => clk, reset => reset,mode => mode,output => output(i), rightInput => '0');
            end generate ffvuoti2;
            
            ffintermedi:if i > Y and i < N-Y+1 generate
            ff: ffd_bidirezionale PORT MAP(a => a, leftInput => output(i-Y) , clk => clk, reset => reset,mode => mode,output => output(i), rightInput => output(i+Y));
            end generate ffintermedi;
 
end generate;


end Structural;

--architecture Behavioral of shift_register_bidirezionale is
--signal reg: std_logic_vector (1 to N);
--signal zeri: std_logic_vector (1 to Y):=(others => '0'); 
--begin
--main: process (clk)
--begin
--    if (clk = '1' and clk'event) then
--        if ( reset = '1') then
--           reg <= (others => '0');
--        else
--            if( a = '1') then
--                if ( mode = '1' ) then
--                    if(a='1') then
--                        reg <= input & zeri(1 to Y-1) & reg(1 to N-Y);
--                    end if;
--                else
--                     if(a='1') then
--                        reg <= reg(Y+1 to N) & zeri(1 to Y-1) & input;
--                     end if;
--                end if;
--            end if;
--        end if;
--    end if;
--end process;

--output <= reg;



--end Behavioral;