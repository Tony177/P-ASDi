----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2021 21:39:34
-- Design Name: 
-- Module Name: sistema - Behavioral
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



--sistema composto da 3 automi (riconoscitore1,riconoscitore2,gestore_ric) e da un gestore dell'output
--il gestore_ric non è un semplice decoder perchè è possibile che nessuno dei due riconoscitori è stato attivato se il modo non è stato ancora definito
--ingressi dato,clk,rst(asincrono), modo
--dato e modo sono sincroni rispetto al clock
-- se premo il tasto di reset in qualunque punto mi trovo nel riconoscimento della sequenza torno indietro allo stato iniziale del gestore (IL TASTO DI RESET = B2)
--resetto il riconoscitore e devo settare di nuovo il modo
--per settare il modo premo B2 e prendo il valore al rilascio del pulsante, quindi sul fronte di discesa
-- una volta settato il modo, il gestore sceglie quale dei due riconoscitori attivare con il segnale di abilitazione
--per acquisire i valori di dato uso B1 con fronte di salita
-- l'uscita varia a seconda dell'abilitazione, il gestore dell'output sceglie quale uscita prendere tra i due riconoscitori,
--uso un led per riconoscere la sequenza

entity sistema is
    Port ( 
        d,clk,rst,m: in std_logic;
        u: out std_logic
    );
end sistema;

architecture structural of sistema is
    component riconoscitore1 port(
        d,clk,a: in std_logic;
        u: out std_logic
    );
    end component;
    component riconoscitore2 port(
        d,clk,a: in std_logic;
        u: out std_logic
    );
    end component;
    component gestore_ric  port(
        clk,rst,m: in std_logic;
        u: out std_logic_vector(0 to 1)
    );
    end component;
    component gestore_output  port(
        out1,out2: in std_logic;
        ab: in std_logic_vector(0 to 1);
        u: out std_logic
    );
    end component;
    signal ab: std_logic_vector(0 to 1);
    signal out1,out2: std_logic;
begin
    ent1:  riconoscitore1 port map(
        d => d,
        clk => clk,
        a => ab(0),
        u => out1
    );
    ent2:  riconoscitore2 port map(
        d => d,
        clk => clk,
        a => ab(1),
        u => out2
    );
    ent3:  gestore_ric port map(
        clk => clk,
        rst => rst,
        m => m,
        u => ab    
    );
    ent4: gestore_output port map(
        out1 => out1,
        out2 => out2,
        ab => ab,
         u => u
    );
end structural;
