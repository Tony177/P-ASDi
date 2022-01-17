----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.01.2022 16:06:59
-- Design Name: 
-- Module Name: operative_unit - Behavioral
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
--use IEEE.STD_LOGIC_1164.log;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity operative_unit is
    GENERIC ( N : integer:= 2);
    Port ( 
        ind_source: in std_logic_vector(1 downto 0);
        ind_dest: in std_logic_vector(1 downto 0);
        data_in: in std_logic_vector(0 to 4*N-1);
        data_out: out std_logic_vector(0 to 4*N-1)                          
        
    );
end operative_unit;

architecture Structural of operative_unit is
    component blocco_instr
        port(
            data_in1: in std_logic_vector(0 to N-1);
            data_in2: in std_logic_vector(0 to N-1);
            data_out1: out std_logic_vector(0 to N-1);
            data_out2: out std_logic_vector(0 to N-1);
            source: in std_logic;
            dest: in std_logic
        );
    end component;
    type temp_vector is array(0 to 3) of std_logic_vector(0 to N-1);       
    signal vettore_segnali: temp_vector;
begin
    
    blocco0_1: blocco_instr port map(
                        data_in1 =>  data_in(0 to N-1),
                        data_in2 =>  data_in(2*N to 3*N-1),
                        data_out1 => vettore_segnali(0),
                        data_out2 => vettore_segnali(1),
                        source => ind_source(1),
                        dest => ind_dest(1)
                     );
    blocco0_2: blocco_instr port map(
                        data_in1 =>  data_in(N to 2*N-1),
                        data_in2 =>  data_in(3*N to 4*N-1),
                        data_out1 => vettore_segnali(2),
                        data_out2 => vettore_segnali(3),
                        source => ind_source(1),
                        dest => ind_dest(1)
                     );   
                     
      blocco1_1: blocco_instr port map(
                        data_in1 => vettore_segnali(0),
                        data_in2 => vettore_segnali(2),
                        data_out1 => data_out(0 to N-1),
                        data_out2 => data_out(N to 2*N-1),
                        source => ind_source(0),
                        dest => ind_dest(0)
                     );
                     
    blocco1_2: blocco_instr port map(
                        data_in1 => vettore_segnali(1),
                        data_in2 => vettore_segnali(3),
                        data_out1 => data_out(2*N to 3*N-1),
                        data_out2 => data_out(3*N to 4*N-1),
                        source => ind_source(0),
                        dest => ind_dest(0)
                     ); 
end Structural;
