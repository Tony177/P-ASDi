----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.12.2021 17:21:29
-- Design Name: 
-- Module Name: sistema_complessivo - Structural
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

entity sistema_complessivo is
    port(clock: in std_logic; 
        switch_b: in std_logic_vector ( 1 to 6);
        reset: in std_logic;
        set: in std_logic;
        anodi: out std_logic_vector ( 7 downto 0);
        catodi: out std_logic_vector ( 7 downto 0)
    );
end sistema_complessivo;

architecture Structural of sistema_complessivo is
component debouncer port ( button : in STD_LOGIC; clock : in STD_LOGIC; cleared_button : out STD_LOGIC);
end component;
component gestore_set port(clock : in STD_LOGIC;clr_button : in STD_LOGIC; dato : in STD_LOGIC_VECTOR (1 to 6);output : out STD_LOGIC_VECTOR (1 to 17):= (others=>'0'); set : out STD_LOGIC := '0');
end component;
component sistema_cont port(clock : in STD_LOGIC; reset : in STD_LOGIC; set : in STD_LOGIC; input: in std_logic_vector(1 to 17 ) := (others => '0'); output : out STD_LOGIC_VECTOR (1 to 17));
end component;

FOR ALL: sistema_cont USE ENTITY work.sistema_contatori ( Structural);
FOR ALL: debouncer USE ENTITY work.debouncer(Behavioral);
FOR ALL: gestore_set USE ENTITY work.gestore_set(Behavioral);
signal set_button, reset_button, set_contatori:std_logic;
signal output_set, output_contatori: std_logic_vector(1 to 17);

begin

sis_contatori: sistema_cont port map(clock => clock, reset => reset_button, set => set_button,input(1 to 17) => output_set (1 to 17), output ( 1 to 17) => output_contatori(1 to 17));
g_set: gestore_set port map(clock => clock,clr_button => set_button, dato(1 to 6) => switch_b (1 to 6), output (1 to 17)=> output_set (1 to 17),set => set_contatori);
deb_set: debouncer port map(clock => clock,button => set ,cleared_button => set_button);
deb_reset: debouncer port map(clock => clock,button => reset ,cleared_button => reset_button);

end Structural;
