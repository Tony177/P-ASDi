----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.01.2022 12:01:00
-- Design Name: 
-- Module Name: blocco_instr - Behavioral
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

entity blocco_instr is
        port(
            data_in1: in std_logic_vector(0 to 1);
            data_in2: in std_logic_vector(0 to 1);
            data_out1: out std_logic_vector(0 to 1);
            data_out2: out std_logic_vector(0 to 1);
            source: in std_logic;
            dest: in std_logic
        );
end blocco_instr;

architecture Dataflow of blocco_instr is

begin
    data_out1 <= data_in1 when source = '0' and dest = '0' else
                 data_in2 when source = '1' and dest = '0' else
                 "00";
    data_out2 <= data_in1 when source = '0' and dest = '1' else
                 data_in2 when source = '1' and dest = '1' else
                 "00";        

end Dataflow;
