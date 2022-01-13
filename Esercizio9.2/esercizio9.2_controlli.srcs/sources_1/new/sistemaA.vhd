----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.01.2022 16:11:25
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
    Generic(N:integer:=2);
    Port ( output : out STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           div_out: out std_logic;
           r: out std_logic;
           ris,error: in std_logic );
           --write: in std_logic);
end sistemaA;

architecture Structural of sistemaA is
component UARTcomponent
Generic (
		BAUD_DIVIDE_G : integer := 55;-- 55;
		BAUD_RATE_G   : integer := 869--869
	);
port(   TXD 	: out 	std_logic  	:= '1';					-- Transmitted serial data output
		RXD 	: in  	std_logic := '1';								-- Received serial data input
		CLK 	: in  	std_logic;							-- Clock signal
		DBIN 	: in  	std_logic_vector (7 downto 0) := (others => '0');		-- Input parallel data to be transmitted
		DBOUT 	: out 	std_logic_vector (7 downto 0);		-- Recevived parallel data output
		RDA		: inout  std_logic;							-- Read Data Available
		TBE		: out 	std_logic 	:= '1';					-- Transfer Buffer Emty
		RD		: in  	std_logic := '0';							-- Read Strobe
		WR		: in  	std_logic;							-- Write Strobe
		PE		: out 	std_logic;							-- Parity error		
		FE		: out 	std_logic;							-- Frame error
		OE		: out 	std_logic;							-- Overwrite error
		RST		: in  	std_logic	:= '0');
end component;
for all: UARTcomponent use entity work.UARTcomponent(Behavioral);

component contatore Generic( N:positive);
                    Port ( clock : in STD_LOGIC;
                          reset : in STD_LOGIC; 
                          ab : in STD_LOGIC; 
                          output : out STD_LOGIC_VECTOR (1 to integer( ceil( log2(real(N) ) ) ));
                          div : out STD_LOGIC);
end component;
for all: contatore use entity work.contatore(Behavioral);

component ROM Generic ( N: integer);
              Port ( output : out STD_LOGIC_VECTOR (7 downto 0):=(others => '0');
                     read, clk: in STD_LOGIC ;
                     count: in std_logic_vector ( 1 to integer( ceil( log2(real(N) ) ) ) ));
end component;
for all: ROM use entity work.ROM(Behavioral);

component control_unitA Port ( clk : in STD_LOGIC;
                               div : in STD_LOGIC;
                               reset : in STD_LOGIC;
                               write : out STD_LOGIC;
                               TBE : in STD_LOGIC;
                                r,ab_counter: out std_logic;
                                ris,error: in std_logic);
end component;
for all: control_unitA use entity work.control_unitA(Behavioral);

component delay_block Port ( input : in STD_LOGIC;
                             output : out STD_LOGIC;
                             clk : in STD_LOGIC);
end component;
for all: delay_block use entity work.delay_block(Behavioral);

signal write_signal,TBE,div, delay_write,ab_counter:std_logic;
signal value: std_logic_vector(7 downto 0);
signal counter_value: std_logic_vector ( 1 to integer( ceil( log2(real(N) ) ) ) );
begin

uartA: UARTcomponent port map(
            TXD => output,
            RXD => open,
            CLK => clk,
            DBIN => value,
            DBOUT => open,
            RDA	=> open,
            TBE	=> TBE,
            RD => open,
            WR=> delay_write,
            PE => open,
            FE => open,
            OE => open,
            RST	 => reset);

counterA: contatore generic map(N => N) port map(clock => clk, reset => reset, div => div, ab => ab_counter, output => counter_value);

RomA: ROM generic map(N => N) port map(clk => clk, read => write_signal, output => value, count => counter_value);

control_unit: control_unitA port map(clk => clk, reset => reset, div => div, write => write_signal, TBE => TBE, r => r, ris => ris, ab_counter=> ab_counter, error => error);

delay: delay_block port map(clk => clk, input => write_signal, output => delay_write);

div_out <= div;

end Structural;
