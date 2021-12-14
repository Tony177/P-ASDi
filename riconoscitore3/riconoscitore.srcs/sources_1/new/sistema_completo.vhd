----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.12.2021 20:20:26
-- Design Name: 
-- Module Name: sistema_completo - Behavioral
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
use work.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sistema_completo is
    Port ( 
        b:    in std_logic_vector(0 to 1);
        s1,s2,clk: in std_logic;
        led: out std_logic
    );
end sistema_completo;

architecture Behavioral of sistema_completo is
    component sistema Port ( 
        d,clk,rst,m: in std_logic;
        u: out std_logic
    );
    end component;
    component debouncer Port ( 
       CLK : in STD_LOGIC;
       BTN : in STD_LOGIC;
       CLEARED_BTN : out STD_LOGIC
    );
    end component;
    component gestore_dato Port ( 
        cb,s,clk: in std_logic;
        u: out std_logic
    );
    end component;
    component gestore_modo Port ( 
        cb,s,clk: in std_logic;
        u: out std_logic
    );
    end component;
    
    signal cb: std_logic_vector(0 to 1);
    signal d,m: std_logic;
begin
--    db1_2 : for i in 0 to 1 generate 
--        deb: debouncer port map(
--            CLK => clk,
--            BTN => b(i),
--            CLEARED_BTN => cb(i)
--    );
--    END generate;
    
    deb1: debouncer port map(
            CLK => clk,
            BTN => b(0),
            CLEARED_BTN => cb(0)
    );
    
    deb2: debouncer port map(
            CLK => clk,
            BTN => b(1),
            CLEARED_BTN => cb(1)
    );
    
   gdato: gestore_dato Port map( 
        cb => cb(0),
        s => s1,
        clk => clk,
        u => d
    );
    gmodo: gestore_modo Port map( 
        cb => cb(1),
        s => s2,
        clk => clk,
        u => m
    );
    
    sis: sistema Port map( 
        d => d,
        clk => clk,
        rst => cb(1),
        m => m,
        u => led
    );
    
    
end Behavioral;
