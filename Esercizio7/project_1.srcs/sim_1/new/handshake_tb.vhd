----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2022 12:52:45
-- Design Name: 
-- Module Name: handshake_tb - Behavioral
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

entity handshake_tb is
--  Port ( );
end handshake_tb;

architecture Behavioral of handshake_tb is
component sistemaA 
   generic(N: positive:= 4; M: positive:= 4);
    Port ( r : out STD_LOGIC;
           clk : in std_logic;
           ris : in STD_LOGIC;
           data : out STD_LOGIC_VECTOR(0 to M-1));
   end component;

component sistemaB 
   generic(N: positive:= 4; M: positive:= 4);
    Port ( r : in STD_LOGIC;
           clk : in std_logic;
           ris : out STD_LOGIC;
           data : in STD_LOGIC_VECTOR(0 to M-1));
   end component;

   constant CLK_periodA : time := 20ns;
   constant CLK_periodB : time := 10ns;
   --ricorda: il limite di frequenza sta nel contatore, ovverp il segnale di ris deve essere alto per almeno un colpo di clock del sistema A, altrimenti il contatore non lo vede e non si incrementa
   signal r,clkA,clkB,ris : STD_LOGIC := '0';
   signal data :  STD_LOGIC_VECTOR(0 to 4-1);

begin
    entita1: sistemaA port map(clk => clkA, r => r, ris => ris, data => data);
     

    entita2: sistemaB port map(clk => clkB, r => r, ris => ris, data => data);

    clkA_proc: process
    begin
        clkA <= '0';
        wait for CLK_periodA/2;
        clkA <= '1';
        wait for CLK_periodA/2;
    end process;
    
     clkB_proc: process
    begin
        clkB <= '0';
        wait for CLK_periodB/2;
        clkB <= '1';
        wait for CLK_periodB/2;
    end process;

end Behavioral;
