----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.12.2021 17:06:41
-- Design Name: 
-- Module Name: rete_16_4 - Behavioral
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

entity rete_16_4 is
    Port ( uscita : out STD_LOGIC_VECTOR (0 to 3);
           sel_mux : in STD_LOGIC_VECTOR (0 to 3);
           sel_demux : in STD_LOGIC_VECTOR (0 to 1));
end rete_16_4;

architecture Structural of rete_16_4 is
COMPONENT mux_16_1 PORT (a1 : in STD_LOGIC_VECTOR (0 to 15); s1 : in STD_LOGIC_VECTOR (0 to 3); o1 : out STD_LOGIC);
END COMPONENT;
FOR ALL: mux_16_1 USE ENTITY WORK.mux_16_1 (Structural);

COMPONENT demux_4_1 PORT (input : in STD_LOGIC; output : out STD_LOGIC_VECTOR (0 to 3); enable : in STD_LOGIC_VECTOR (0 to 1));
END COMPONENT;
FOR ALL: demux_4_1 USE ENTITY WORK.demux_4_1 (Behavioral);

signal interco : STD_LOGIC;
signal ing: STD_LOGIC_VECTOR(0 to 15) := "1000000000000000";
begin
    
    mux : mux_16_1
    PORT MAP (
    a1(0 to 15) => ing(0 to 15),
    s1( 0 to 3) => sel_mux(0 to 3),
    o1 => interco
    ); 
    demux : demux_4_1
    PORT MAP (
    input => interco,
    enable( 0 to 1) => sel_demux(0 to 1),
    output(0 to 3) => uscita ( 0 to 3)
    );


end Structural;
