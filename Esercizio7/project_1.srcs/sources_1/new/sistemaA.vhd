----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.12.2021 18:29:23
-- Design Name: 
-- Module Name: sistemaA - Behavioral
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
use IEEE.math_real."log2";
use IEEE.math_real."ceil";
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sistemaA is
    generic( N: positive; M: positive);
    Port ( r : out STD_LOGIC;
           clk : in std_logic;
           ris : in STD_LOGIC;
           data : out STD_LOGIC_VECTOR(0 to M-1):= (others => '0'));
end sistemaA;

architecture Behavioral of sistemaA is

   component ROM 
     Generic ( N: integer; M: integer);                                             
    Port ( output : out STD_LOGIC_VECTOR (0 to M-1);                               
           read, clk: in STD_LOGIC ;                                               
           count: in std_logic_vector ( 1 to integer( ceil( log2(real(N) ) ) ) )); 
   end component;
   
   component contatore
        Generic( N:integer);
        Port ( clk : in STD_LOGIC;
             ris : in std_logic;
           div : out STD_LOGIC;
           count: out std_logic_vector ( 1 to integer( ceil( log2(real(N) ) ) ) )); 
   end component;
   
   component interfacciaA
   generic( M: positive);
    Port ( clk : in STD_LOGIC;
            ris : in STD_LOGIC;
            div : in STD_LOGIC;
            datain : in STD_LOGIC_VECTOR(0 to M-1);
            r : out STD_LOGIC;
            read : out STD_LOGIC;
            dataout : out STD_LOGIC_VECTOR(0 to M-1):=(others => '0'));
   end component;
   
   signal read_temp,div_temp: std_logic:='0';
   signal output_temp:  STD_LOGIC_VECTOR (0 to M-1):= (others => '0');
   signal  count_temp: std_logic_vector ( 1 to integer( ceil( log2(real(N) ) ) ) ); 
   
begin
    ROM1: ROM generic map( N => N, M => 4) 
              port map(clk => clk, read => read_temp, output => output_temp, count => count_temp);
              
    contatore1: contatore generic map( N => N) 
                          port map(clk => clk, ris => ris, div => div_temp, count => count_temp); 
                          
    interfacciaA1: interfacciaA generic map(M => 4) 
                                port map(clk => clk, ris=> ris, div=> div_temp, datain => output_temp, r => r, read => read_temp, dataout => data);   
end Behavioral;
