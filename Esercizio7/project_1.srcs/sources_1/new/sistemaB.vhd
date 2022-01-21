----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.12.2021 18:29:23
-- Design Name: 
-- Module Name: sistemaB - Behavioral
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
use IEEE.math_real."log2";
use IEEE.math_real."ceil";
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sistemaB is
     generic( N: positive; M: positive);
    Port ( r : in STD_LOGIC;
           clk : in std_logic;
           ris : out STD_LOGIC;
           data : in STD_LOGIC_VECTOR(0 to M-1):= (others => '0'));
end sistemaB;

architecture Structural of sistemaB is
component interfacciaB 
    Generic( M: positive);
    Port ( clk : in STD_LOGIC;
           r : in STD_LOGIC;
           ris : out STD_LOGIC;
           DataIn : in STD_LOGIC_VECTOR (0 to M-1);
           DataOut : out STD_LOGIC_VECTOR (0 to M-1);
           div : in STD_LOGIC;
           ab_control : out STD_LOGIC;
           ab_interfaccia : in STD_LOGIC);
end component;
for all: InterfacciaB use entity work.interfacciaB(Behavioral);

component MemoriaB 
    Generic(N:positive; M:positive);--N è il numero di locazioni delle Y, la memoria totale sarà quindi 2N
    Port (clk: in std_logic;
        read, write: in std_logic;
        Data_read: out std_logic_vector(0 to M-1);
        Data_write: in std_logic_vector(0 to M-1);
        counter_value: in std_logic_vector ( 1 to integer( ceil( log2(real(N) ) ) ) ));
end component;
for all: MemoriaB use entity work.MemoriaB(Behavioral);

component control_unit  
    Generic(M:positive);
    Port ( ab_control : in STD_LOGIC := '0';
           ab_interfaccia : out STD_LOGIC := '0'; 
           DataIn : in STD_LOGIC_VECTOR(0 to M-1);
           read : out STD_LOGIC;
           write : out STD_LOGIC;
           Data_y : in STD_LOGIC_VECTOR(0 to M-1);
           Data_sum : out STD_LOGIC_VECTOR(0 to M-1);
           clk : in STD_LOGIC);
end component;
for all: control_unit use entity work.control_unit(Behavioral);

component contatore
     Generic( N:integer);
        Port(clk : in STD_LOGIC;
             ris : in std_logic;
             div : out STD_LOGIC;
             count: out std_logic_vector ( 1 to integer( ceil( log2(real(N) ) ) ) )); 
end component;
for all: contatore use entity work.contatore(Behavioral);

component delay_block Port ( input : in STD_LOGIC;
                             output : out STD_LOGIC;
                             clk : in STD_LOGIC);
end component;
for all: delay_block use entity work.delay_block(Behavioral);
signal ab_control_temp,ab_interfaccia_temp,ab_interfaccia_delay,read,write,div: std_logic;
signal datoX,datoY,Data_Sum_temp: std_logic_vector(0 to M-1);
signal count: std_logic_vector ( 1 to integer( ceil( log2(real(N) ) ) ) );


begin

interfacciaB1: InterfacciaB generic map(M => M) port map(ab_control => ab_control_temp, ab_interfaccia => ab_interfaccia_temp,clk => clk, r=>r, ris=>ris, DataIn=>data, DataOut => datoX,div=>div);

memoriaB1: memoriaB generic map(N=>N, M=>M) port map(clk=>clk, read=>read, write=>write, Data_read=>datoY, Data_write => Data_Sum_temp, counter_value=>count);

contatoreB: contatore generic map( N => N) port map(clk => clk, ris => ab_interfaccia_delay, div => div, count => count);

control_unitB: control_unit generic map(M=>M) port map(ab_control => ab_control_temp, ab_interfaccia => ab_interfaccia_temp,clk=>clk, read=>read, write=>write, DataIn=>datoX, Data_y=>DatoY, Data_sum => Data_Sum_temp);

delay: delay_block port map(clk=>clk, input => ab_interfaccia_temp, output => ab_interfaccia_delay);
end Structural;
