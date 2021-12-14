----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.12.2021 16:37:00
-- Design Name: 
-- Module Name: DecoderExt - Behavioral
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

entity DecoderExt is
    Port ( inputExt : in STD_LOGIC_VECTOR (0 to 9);
           outputExt : out STD_LOGIC_VECTOR (0 to 3));
end DecoderExt;

architecture Structural of DecoderExt is
signal ArbitroToDecoder: STD_LOGIC_VECTOR (0 to 9);
component Dec PORT (input : in STD_LOGIC_VECTOR (0 to 9); output : out STD_LOGIC_VECTOR (0 to 3));
end component;

component Arb PORT (ingresso : in STD_LOGIC_VECTOR (0 to 9);
           uscita : out STD_LOGIC_VECTOR (0 to 9));
end component;

FOR ALL : Dec USE ENTITY WORK.Decoder (Behavioral);
FOR ALL : Arb USE ENTITY WORK.Arbitro (Behavioral);
begin

D1: Dec PORT MAP( input (0 to 9) => ArbitroToDecoder (0 to 9), output (0 to 3) => outputExt (0 to 3));

A1: Arb PORT MAP(ingresso (0 to 9) => inputExt (0 to 9), uscita (0 to 9) => ArbitroToDecoder (0 to 9));

end Structural;
