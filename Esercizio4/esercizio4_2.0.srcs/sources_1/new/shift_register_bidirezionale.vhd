----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.01.2022 10:26:29
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
    Generic( N: positive :=6);
    Port ( input : in STD_LOGIC;
           output : inout STD_LOGIC_VECTOR (1 to N);
           clk : in STD_LOGIC;
           mode,a : in bit;--0 sinsitra, 1 destra;
           reset : in STD_LOGIC;
           shift: in bit:='0');-- 0 shifta di 1, 1 shifta di 2
end shift_register_bidirezionale;

--architecture Behavioral of shift_register_bidirezionale is
--signal reg: std_logic_vector (1 to N);
----signal zeri: std_logic_vector (1 to shift + 1):=(others => '0'); 
--begin
--main: process (clk)
--begin
--    if (clk = '1' and clk'event) then
--        if ( reset = '1') then
--           reg <= (others => '0');
--        else
--              if ( mode = '1' ) then
--                    if(a='1') then
--                        if(shift = '0') then
--                            reg <= input & reg(1 to N-1);
--                         elsif(shift = '1') then
--                             reg <= input & '0' & reg(1 to N-2);
--                         end if;
--                    end if;
--                else
--                     if(a='1') then
--                        if(shift = '0') then
--                            reg <= reg(2 to N) & input;
--                         elsif(shift = '1') then
--                             reg <= reg(3 to N)& '0' & input;
--                         end if;
--                     end if;
--                end if;
--            end if;
--        end if;
--end process;

--output <= reg;

--end Behavioral;

architecture Structural of shift_register_bidirezionale is

component ffd_bidirezionale PORT (leftInput, rightInput, clk, reset : in STD_LOGIC;
                    mode,a: in bit;
                    output : out STD_LOGIC);
end component;
for all: ffd_bidirezionale use entity work.ffd_bidirezionale(Behavioral);

component mux_2_1 Port ( x1,x2 : in STD_LOGIC;
                        s : in bit;
                        y : out STD_LOGIC);
end component;
for all: mux_2_1 use entity work.mux_2_1(Behavioral);

signal muxLeft: std_logic_vector(2 to N);
signal muxRight: std_logic_vector(1 to N-1);
begin
flipflop : for i in 1 to N generate

            primoff:if i = 1 generate
                     mux_right: mux_2_1 port map( x1 => output(i+1), x2 => output(i+2), s => shift, y => muxRight(i));
                     ff: ffd_bidirezionale PORT MAP(a => a, leftInput => input, clk => clk, reset => reset,mode => mode,output => output(i), rightInput => muxRight(i));
            end generate primoff;
            
            
            ultimoff:if i = N generate
                        mux_left: mux_2_1 port map( x1 => output(i-1), x2 => output(i-2), s => shift, y => muxleft(i));
                        ff: ffd_bidirezionale PORT MAP(a => a, leftInput => muxleft(i) , clk => clk, reset => reset,mode => mode,output => output(i), rightInput => input);
            end generate ultimoff;
            
             ff_with_left0:if i=2 generate
                                mux_right: mux_2_1 port map( x1 => output(i+1), x2 => output(i+2), s => shift, y => muxRight(i));
                                mux_left: mux_2_1 port map( x1 => output(i-1), x2 => '0', s => shift, y => muxleft(i));
                                ff: ffd_bidirezionale PORT MAP(a => a, leftInput => muxleft(i) , clk => clk, reset => reset,mode => mode,output => output(i), rightInput => muxRight(i));
             end generate ff_with_left0;
            
             ff_with_rigth0:if i= N-1 generate
                                mux_right: mux_2_1 port map( x1 => output(i+1), x2 => '0', s => shift, y => muxRight(i));
                                mux_left: mux_2_1 port map( x1 => output(i-1), x2 => output(i-2), s => shift, y => muxleft(i));
                                ff: ffd_bidirezionale PORT MAP(a => a, leftInput => muxleft(i) , clk => clk, reset => reset,mode => mode,output => output(i), rightInput => muxRight(i));
             end generate ff_with_rigth0;
        
            ffintermedi:if i > 2 and i < N-1 generate        
                            mux_right: mux_2_1 port map( x1 => output(i+1), x2 => output(i+2), s => shift, y => muxRight(i));
                            mux_left: mux_2_1 port map( x1 => output(i-1), x2 => output(i-2), s => shift, y => muxleft(i));
                            ff: ffd_bidirezionale PORT MAP(a => a, leftInput => muxleft(i) , clk => clk, reset => reset,mode => mode,output => output(i), rightInput => muxRight(i));
            end generate ffintermedi;
 
end generate;

end Structural;

