----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2022 14:41:32
-- Design Name: 
-- Module Name: sistema_complessivo - Behavioral
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
     generic( N: integer := 4);
    Port ( 
        clk : in std_logic;
        start: in std_logic;
        reset: in std_logic; 
        switch: in std_logic_vector(2*N-1 downto 0); --op1,op2
        anodi: out std_logic_vector(7 downto 0);
        catodi: out std_logic_vector(7 downto 0)
    );
end sistema_complessivo;

architecture Structural of sistema_complessivo is

component  display_seven_segments   
    port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           VALUE : in  STD_LOGIC_VECTOR (31 downto 0);
           ENABLE : in  STD_LOGIC_VECTOR (7 downto 0); -- decide quali cifre abilitare
           DOTS : in  STD_LOGIC_VECTOR (7 downto 0); -- decide quali punti visualizzare
           ANODES : out  STD_LOGIC_VECTOR (7 downto 0);
           CATHODES : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component divisore
    generic( N: integer := N);
    port(
        clk:in std_logic;
        start: in std_logic;
        reset: in std_logic;
        input_dividendo: in std_logic_vector(N-1 downto 0); 
        input_divisore: in std_logic_vector(N-1 downto 0); 
        output: out std_logic_vector(2*N-1 downto 0) --op1,op2
    );
end component;

component debouncer
     Port ( button : in STD_LOGIC;
           clock : in STD_LOGIC;
           cleared_button : out STD_LOGIC);
end component;

signal start_cleared,reset_cleared: std_logic := '0';
signal enable: STD_LOGIC_VECTOR (7 downto 0):= "11111111";
signal output:  std_logic_vector(31 downto 0);
signal output_divisore: std_logic_vector(2*N-1 downto 0);
begin

deb_reset: debouncer port map(  button=> reset, clock=> clk, cleared_button=> reset_cleared);
deb_start: debouncer port map(  button=> start, clock=> clk, cleared_button=> start_cleared);

divisore_1: divisore 
        generic map ( N => N)
        port map(
            clk => clk,
            start => start_cleared,
            reset => reset_cleared,
            input_dividendo => switch(2*N-1 downto N),
            input_divisore => switch(N-1 downto 0),
            output => output_divisore
        );
        
    output(31 downto 2*N) <= (others => '0');
    output(2*N-1 downto 0) <= output_divisore;

display:   display_seven_segments   
    port map(  
               CLK => clk,
               RST => reset_cleared,
               VALUE => output,
               ENABLE => enable,
               DOTS => (others =>'0'),
               ANODES => anodi,
               CATHODES => catodi
            );



end Structural;
