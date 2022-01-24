----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.01.2022 15:33:55
-- Design Name: 
-- Module Name: buffer - Behavioral
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

entity buffer_uscita is
    generic (N : integer:=2);
    port(
        clk : in std_logic;
        data_in: in std_logic_vector(0 to 4*N-1);
        ind_source_in: in std_logic_vector(0 to 1);
        ind_dest_in: in std_logic_vector(0 to 1);
        data_out: out std_logic_vector(0 to 4*N-1);
        ind_source: out std_logic_vector(0 to 1);
        ind_dest: out std_logic_vector(0 to 1);
        start: in std_logic
    );
end buffer_uscita;

architecture Behavioral of buffer_uscita is
type stato is (qinit,q1);
signal temp_ind_source,temp_ind_dest: std_logic_vector(0 to 1);
signal data_temp: std_logic_vector(0 to 4*N-1);
signal stato_corrente: stato:=qinit;
begin
    ctrl_state: process(clk)
        begin
            if(clk = '1' and clk'event) then
                case stato_corrente is
                   when qinit => 
                             if(start = '1') then
                                temp_ind_source <= (others => '0');
                                temp_ind_dest <= (others =>  '0');
                                data_temp <= (others =>  '0');
                                 stato_corrente <= q1;                                  
                             else
                                stato_corrente <= qinit;
                            end if;    
                    when  q1 => temp_ind_source <= ind_source_in;
                                temp_ind_dest <= ind_dest_in;
                                data_temp <= data_in;
                                stato_corrente <= qinit;
                    when others =>  stato_corrente <= qinit;
                end case;
            end if;
        end process;
data_out <= data_temp;
ind_source <= temp_ind_source;
ind_dest <= temp_ind_dest;

end Behavioral;
