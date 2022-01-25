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
        set, modo,read,write: in std_logic;
        leds: out std_logic_vector (2 downto 0);    --ho aggiunto i led
        anodi: out std_logic_vector ( 7 downto 0);
        catodi: out std_logic_vector ( 7 downto 0)
    );
end sistema_complessivo;

architecture Structural of sistema_complessivo is
component debouncer port ( button : in STD_LOGIC; clock : in STD_LOGIC; cleared_button : out STD_LOGIC);
end component;
component gestore_set port(clock : in STD_LOGIC;reset: in STD_LOGIC;clr_button : in STD_LOGIC; dato : in STD_LOGIC_VECTOR (1 to 6);output : out STD_LOGIC_VECTOR (1 to 17):= (others=>'0'); set : out STD_LOGIC := '0'; leds : out STD_LOGIC_VECTOR(2 downto 0); abModo: in std_logic);
end component;
component sistema_cont port(clock : in STD_LOGIC; reset : in STD_LOGIC; set : in STD_LOGIC; input: in std_logic_vector(1 to 17 ) := (others => '0'); output : out STD_LOGIC_VECTOR (1 to 17));
end component;
component conv port (input : in STD_LOGIC_VECTOR (1 to 17); output : out STD_LOGIC_VECTOR (1 to 32));
end component;
component display port ( CLK : in  STD_LOGIC; RST : in  STD_LOGIC; VALUE : in  STD_LOGIC_VECTOR (31 downto 0); ENABLE : in  STD_LOGIC_VECTOR (7 downto 0); DOTS : in  STD_LOGIC_VECTOR (7 downto 0); ANODES : out  STD_LOGIC_VECTOR (7 downto 0);CATHODES : out  STD_LOGIC_VECTOR (7 downto 0));
end component;
component memoria generic( N:integer); port ( input : in STD_LOGIC_VECTOR (1 to 32); output : out STD_LOGIC_VECTOR (1 to 32); clk : in STD_LOGIC; read,write,reset,abModo: in STD_LOGIC);
end component;
component gestore_modo port(i_cronometro : in STD_LOGIC_VECTOR (1 to 32); i_intertempi : in STD_LOGIC_VECTOR (1 to 32); output : out STD_LOGIC_VECTOR (1 to 32); cleared_button : in STD_LOGIC; clk : in STD_LOGIC; abModo:out std_logic; reset:in std_logic);
end component;
component wait_block is
    Port ( input : in STD_LOGIC; --modo
           output : out STD_LOGIC;
           clk: in std_logic);
end component; 



FOR ALL: sistema_cont USE ENTITY work.sistema_contatori (Structural);
FOR ALL: debouncer USE ENTITY work.debouncer(Behavioral);
FOR ALL: gestore_set USE ENTITY work.gestore_set(Behavioral);
FOR ALL: conv USE ENTITY work.conv_per_display(Dataflow);
FOR ALL: display USE ENTITY work.display_seven_segments(Structural);
FOR ALL: memoria USE ENTITY work.memoria(Behavioral);
FOR ALL: gestore_modo USE ENTITY work.gestore_modo(Behavioral);
FOR ALL: wait_block USE ENTITY work.wait_block(Behavioral);

signal set_button, reset_button, set_contatori,mode_button, abModo, read_button, write_button:std_logic;
signal output_set, output_contatori: std_logic_vector(1 to 17);
signal output_value, output_mem, value_display: std_logic_vector(1 to 32);
begin

sis_contatori: sistema_cont port map(clock => clock, reset => reset_button, set => set_contatori,input(1 to 17) => output_set (1 to 17), output ( 1 to 17) => output_contatori(1 to 17));
g_set: gestore_set port map(abModo => abModo,clock => clock,reset => reset_button,clr_button => set_button, dato(1 to 6) => switch_b (1 to 6), output (1 to 17)=> output_set (1 to 17),set => set_contatori, leds => leds);
deb_set: debouncer port map(clock => clock,button => set ,cleared_button => set_button);
deb_reset: debouncer port map(clock => clock,button => reset ,cleared_button => reset_button);
convert: conv port map(input => output_contatori, output => output_value);
display_ss : display port map(CLK => clock, RST => reset_button, value(31 downto 0) =>  value_display(1 to 32),ENABLE => (7 => '0',6 => '0',others => '1'),DOTS => (4 => '1', 2=> '1', others => '0'), ANODES => anodi, CATHODES => catodi);
                                            --RST => reset_button modificato da Christian per effettuare bene il reset
deb_modo:debouncer port map(clock => clock,button => modo ,cleared_button => mode_button);
deb_read:debouncer port map(clock => clock,button => read ,cleared_button => read_button);
deb_write:debouncer port map(clock => clock,button => write ,cleared_button => write_button);
gmodo: gestore_modo port map(clk => clock, cleared_button => mode_button, i_cronometro => output_value, i_intertempi => output_mem, output => value_display, abModo => abModo,reset => reset_button);
mem: memoria generic map(N => 4) port map(input => output_value, clk => clock, reset => reset_button, write => write_button, output => output_mem, read => read_button, abModo => abModo); 
--devi solo fare la memoria e collegarla bene. poi devi fare un altro gestore per i bottoni di set e reset che in modalit� intertempo non devono essere letti come tali ma come bottoni per la memoria.



end Structural;
