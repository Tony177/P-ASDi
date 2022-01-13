----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.01.2022 16:11:25
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
    Generic( N:integer:=2);
    Port ( input,read : in STD_LOGIC;
           outputB : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           r: in std_logic;
           ris,error: out std_logic);
end sistemaB;

architecture Structural of sistemaB is
component UARTcomponent 
Generic (
		BAUD_DIVIDE_G : integer := 55;
		BAUD_RATE_G   : integer := 869
	);
port(   TXD 	: out 	std_logic  	:= '1';					-- Transmitted serial data output
		RXD 	: in  	std_logic := '1';								-- Received serial data input
		CLK 	: in  	std_logic;							-- Clock signal
		DBIN 	: in  	std_logic_vector (7 downto 0) := (others => '0');		-- Input parallel data to be transmitted
		DBOUT 	: out 	std_logic_vector (7 downto 0);		-- Recevived parallel data output
		RDA		: inout  std_logic:='0';							-- Read Data Available
		TBE		: out 	std_logic 	:= '1';					-- Transfer Buffer Emty
		RD		: in  	std_logic := '0';							-- Read Strobe
		WR		: in  	std_logic := '0';							-- Write Strobe
		PE		: out 	std_logic:='0';							-- Parity error		
		FE		: out 	std_logic:='0';							-- Frame error
		OE		: out 	std_logic;							-- Overwrite error
		RST		: in  	std_logic	:= '0');

end component;

component MemoriaB Generic(N:positive);
                   Port (clk: in std_logic;
                         read, write: in std_logic:='0';
                         Data_read: out std_logic_vector(7 downto 0):=(others=> '0');
                         Data_write: in std_logic_vector(7 downto 0):=(others =>'0');
                         counter_value: in std_logic_vector ( 1 to integer( ceil( log2(real(N) ) ) ) ));
end component;

component control_unitB Port ( RDA : in STD_LOGIC;
                               write,error : out STD_LOGIC:='0';
                               clk : in STD_LOGIC;
                               r,PE, FE: in std_logic;
                                ris, RD: out std_logic);
end component;

component contatore  Generic( N:positive);
                     Port ( clock : in STD_LOGIC;
                            reset : in STD_LOGIC; 
                            ab : in STD_LOGIC; 
                            output : out STD_LOGIC_VECTOR (1 to integer( ceil( log2(real(N) ) ) ));
                            div : out STD_LOGIC:='0');
end component;

component debouncer Port ( button : in STD_LOGIC;
                           clock : in STD_LOGIC;
                           cleared_button : out STD_LOGIC);
end component;

for all: debouncer use entity work.debouncer(Behavioral);
for all: contatore use entity work.contatore(Behavioral);
for all: control_unitB use entity work.control_unitB(Behavioral);
for all: MemoriaB use entity work.MemoriaB(Behavioral);
for all: UARTcomponent use entity work.UARTcomponent(Behavioral);

signal RDA, write, cleared_read,PE, FE, RD: std_logic:='0';
signal value: std_logic_vector(7 downto 0);
signal counter_value: std_logic_vector ( 1 to integer( ceil( log2(real(N) ) ) ) );

begin

uartB: UARTcomponent port map(
            TXD => open,
            RXD => input,
            CLK => clk,
            DBIN => open,
            DBOUT => value,
            RDA	=> RDA,
            TBE	=> open,
            RD => RD,
            WR=> open,
            PE => PE,
            FE => FE,
            OE => open,
            RST	 => reset);


control_unit: control_unitB port map(clk => clk, write => write, RDA => RDA, r => r, ris => ris, PE => PE, FE => FE, error => error, RD => RD);

mam: memoriaB generic map(N => N) port map(clk => clk, write => write, read => cleared_read, data_read => outputB,counter_value => counter_value, Data_write => value);

counter: contatore generic map(N => N) port map( clock => clk, reset => reset, ab => write, output => counter_value, div => open);  

deb: debouncer port map(button => read, clock => clk, cleared_button => cleared_read);
end Structural;
